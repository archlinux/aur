# Maintainer: ouzu <ouzu att laze dott today>
pkgname=esphome-flasher
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="Simple GUI tool to flash ESPs over USB"
arch=("any")
url="https://github.com/esphome/esphome-flasher"
license=('MIT')
depends=("esptool" "python")
makedepends=("python-setuptools" "python-wxpython" "python-requests")
provides=("esphomeflasher")
conflicts=("esphomeflasher")
source=("$pkgname-$pkgver.tar.gz::https://github.com/esphome/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=("3ee2bb5b50d7b26d1300491aa3524bf5")

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
