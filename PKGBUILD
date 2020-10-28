# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
pkgname=qutepart
pkgver=3.3.1
pkgrel=1
pkgdesc="Code editor component for PyQt and Pyside"
arch=('x86_64')
url="https://github.com/hlamer/qutepart"
license=('LGPL')
depends=("python-pyqt5")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hlamer/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('624ee463d5b18e1530badd013fc9086c56a6f837fcfb07c60058dbec80bbc02f')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python tests/run_all.py
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
