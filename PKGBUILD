# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=slice
pkgver=0.6.0
pkgrel=1
pkgdesc='GUI app to generate custom static fonts from variable fonts'
arch=(any)
url="https://github.com/source-foundry/${pkgname^}"
license=('GPL3')
_py_deps=(brotli fonttools pyqt5 zopfli)
depends=(python ${_py_deps[@]/#/python-})
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('23ae83139794011cb7f2197457304ec934d35f89fcb32203b0545e7a9b6daa32')

build() {
	cd "${pkgname^}-$pkgver"
	python setup.py build
}

package() {
	cd "${pkgname^}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
