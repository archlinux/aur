# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=slice
pkgver=0.3.1
pkgrel=1
pkgdesc='GUI app to generate custom static fonts from variable fonts'
arch=(any)
url="https://github.com/source-foundry/${pkgname^}"
license=('GPL3')
_py_deps=(fonttools pyqt5)
depends=(python ${_py_deps[@]/#/python-})
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4cb2890f982759f0cb1f6923f71956216a8adc60d0ddde47e5211a3e119b4596')

build() {
	cd "${pkgname^}-$pkgver"
	python setup.py build
}

package() {
	cd "${pkgname^}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
