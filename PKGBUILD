# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Andrea Benazzo <andy@qitty.net>
pkgname=cryptmount
pkgver=5.3.2
_pkgver=5.3
pkgrel=1
pkgdesc="utility which allows an ordinary user to mount an encrypted file system"
arch=('i686' 'x86_64')
url="http://cryptmount.sourceforge.net/"
license=('GPL')
depends=(libgcrypt device-mapper util-linux)
source=(http://downloads.sourceforge.net/project/cryptmount/cryptmount/cryptmount-$_pkgver/cryptmount-$pkgver.tar.gz)
backup=('etc/cryptmount/cmtab')
sha512sums=('972c7fefadb86bb82cdeb96b185f45bec08ac07d39474a4c7e2a473bc2453624ffcc387b6836a02260dcd0d1176a5a743c45bdf3d7e78d2f519f02a48c62a6b8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
