# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=slice
pkgver=0.5.1
pkgrel=1
pkgdesc='GUI app to generate custom static fonts from variable fonts'
arch=(any)
url="https://github.com/source-foundry/${pkgname^}"
license=('GPL3')
_py_deps=(fonttools pyqt5)
depends=(python ${_py_deps[@]/#/python-})
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b7b62200cd8dbd17c4403e56be891a18dacd13bb8f6cfef9e310f4e4f477a823')

build() {
	cd "${pkgname^}-$pkgver"
	python setup.py build
}

package() {
	cd "${pkgname^}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
