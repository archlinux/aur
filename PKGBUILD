# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Andrea Benazzo <andy@qitty.net>
pkgname=cryptmount
pkgver=5.1
pkgrel=1
pkgdesc="utility which allows an ordinary user to mount an encrypted file system"
arch=('i686' 'x86_64')
url="http://cryptmount.sourceforge.net/"
license=('GPL')
depends=(libgcrypt device-mapper util-linux-ng)
source=(http://downloads.sourceforge.net/project/cryptmount/cryptmount/cryptmount-$pkgver/cryptmount-$pkgver.tar.gz)
backup=('etc/cryptmount/cmtab')
md5sums=('a5425a3e520c5ec89dca84868e25db24')

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
