# Maintainer: Bennett Goble <nivardus@gmail.com>

pkgname=esptool-ck
pkgver=0.4.9
pkgrel=1
pkgdesc='The ESP8266/ESP32 build helper tool by Christian Klippel'
arch=('i686' 'x86_64')
url='https://github.com/igrr/esptool-ck'
license=('GPL')
makedepends=(make glibc)
depends=()
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/igrr/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=(
  'e04590ed1ac4725a0b9ee9b822a39699c851ad275e2cb6713ed5f08f14a4d6b3'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make VERSION="$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 esptool "$pkgdir/usr/bin/esptool"
}
