# Maintainer: Ghassan Alduraibi <aur att ghs.sn>
# Contributor: ouzu <ouzu att laze dott today>
pkgname=esphome-flasher
pkgver=1.4.0
pkgrel=1
epoch=
pkgdesc="ESP8266/ESP32 firmware flasher GUI for ESPHome"
arch=("any")
url="https://github.com/esphome/esphome-flasher"
license=('MIT')
depends=("esptool" "python" "python-pillow" "python-requests" "python-wxpython")
makedepends=("python-installer" "python-wheel")
provides=("esphomeflasher")
conflicts=("esphomeflasher")
source=("$pkgname-$pkgver.tar.gz::https://github.com/esphome/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('4aa6f8d4149a80eba86731b15ea97102')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
