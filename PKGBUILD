# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
pkgname=qutepart
pkgver=3.2.0
pkgrel=1
pkgdesc="Code editor component for PyQt and Pyside"
arch=('x86_64')
url="https://github.com/hlamer/qutepart"
license=('LGPL')
depends=("python-pyqt5")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hlamer/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1e58699b3306077b9faa18baa30cff3edc63eb2058c33f11f4b5aed8bbf3e599')

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
