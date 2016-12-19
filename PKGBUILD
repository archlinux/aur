# Maintainer: Pierre Carrier <pierre@gcarrier.fr>
pkgname=sensible-utils
pkgver=0.0.9
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
arch=('any')
url="http://packages.debian.org/source/sid/sensible-utils"
license=('GPL')
depends=('bash')
makedepends=('po4a')
source=(http://ftp.de.debian.org/debian/pool/main/s/$pkgname/${pkgname}_$pkgver.tar.gz)
md5sums=('559012932ffa95a7bbd8f8423869b652')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
