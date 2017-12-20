# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Andrea Benazzo <andy@qitty.net>
pkgname=cryptmount
pkgver=5.2.3
_pkgver=5.2
pkgrel=1
pkgdesc="utility which allows an ordinary user to mount an encrypted file system"
arch=('i686' 'x86_64')
url="http://cryptmount.sourceforge.net/"
license=('GPL')
depends=(libgcrypt device-mapper util-linux)
source=(http://downloads.sourceforge.net/project/cryptmount/cryptmount/cryptmount-$_pkgver/cryptmount-$pkgver.tar.gz)
backup=('etc/cryptmount/cmtab')
sha512sums=('43a509a5ac1022bd3e6d8e84f2653b7f631a71675d2f0d8c91d9e03d133498e0235a29712438b866fa10c16aa8c748e6292d711f69ee920a2bfa604c0b1ddb68')

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
