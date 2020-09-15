# Maintainer: ouzu <ouzu att laze dott today>
pkgname=esphome-flasher
pkgver=1.3.0
pkgrel=1
epoch=
pkgdesc="Simple GUI tool to flash ESPs over USB"
arch=("any")
url="https://github.com/esphome/esphome-flasher"
license=('MIT')
depends=("esptool" "python" "python-pillow" "python-requests" "python-wxpython")
provides=("esphomeflasher")
conflicts=("esphomeflasher")
source=("$pkgname-$pkgver.tar.gz::https://github.com/esphome/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('b61d426c17800a2da581990c2bd08a08')

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
