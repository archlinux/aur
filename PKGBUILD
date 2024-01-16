# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyperglot
pkgver=0.6.0
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
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e3fdd7e845e7c9c7c4cf9bf554be2ca4e46da5bc3630e185e9aaf503d4f77a0f')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
