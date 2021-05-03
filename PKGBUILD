# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=slice
pkgver=0.6.1
pkgrel=1
pkgdesc='GUI app to generate custom static fonts from variable fonts'
arch=(any)
url="https://github.com/source-foundry/${pkgname^}"
license=('GPL3')
_py_deps=(brotli fonttools pyqt5 zopfli)
depends=(python ${_py_deps[@]/#/python-})
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ec0ab36800794d666e669d7c28cba37541066e72bd170fc8f257b3a98e0d816c')

build() {
	cd "${pkgname^}-$pkgver"
	python setup.py build
}

package() {
	cd "${pkgname^}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
