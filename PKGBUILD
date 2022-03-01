# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyperglot
pkgver=0.3.8
pkgrel=1
pkgdesc='A database and tools for detecting language support in fonts'
arch=(any)
url="https://github.com/rosettatype/$pkgname"
license=(GPL3)
_py_deps=(click
          colorlog
          fonttools
          unicodedata2
          yaml)
depends=(python ${_py_deps[@]/#/python-})
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('067672f89849cea4fee291a49b5827f9c9c5b7e109b78a130ecd8d34aa66b7fc')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
