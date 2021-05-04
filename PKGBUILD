# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=slice
pkgver=0.7.0
pkgrel=1
pkgdesc='GUI app to generate custom static fonts from variable fonts'
arch=(any)
url="https://github.com/source-foundry/${pkgname^}"
license=('GPL3')
_py_deps=(brotli fonttools pyqt5 zopfli)
depends=(python ${_py_deps[@]/#/python-})
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('54e1f8f6a9f6baef785e142c9329305dd83618d3ef8af34256385bce14dd97d9')

build() {
	cd "${pkgname^}-$pkgver"
	python setup.py build
}

package() {
	cd "${pkgname^}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
