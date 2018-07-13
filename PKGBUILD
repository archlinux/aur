# Maintainer: Brad Ackerman <brad@facefault.org>
# Contributor: Bennett Goble <nivardus@gmail.com>

pkgname=esptool-ck
pkgver=0.4.13
pkgrel=1
pkgdesc='The ESP8266/ESP32 build helper tool by Christian Klippel'
provides=('esptool')
arch=('i686' 'x86_64')
url='https://github.com/igrr/esptool-ck'
license=('GPL')
makedepends=(make glibc)
depends=()
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/igrr/$pkgname/archive/$pkgver.tar.gz"
)
sha512sums=(
  '8f303ac48f990c170cd2b9aed903d456e0c715448811595d51d5501464e61f71870fc2166ec3dd935af6e81203dcdab0eed8f55452e50d69ee6a2a6f60ef099c'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make VERSION="$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 esptool "$pkgdir/usr/bin/esptool"
}
