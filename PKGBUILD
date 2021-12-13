# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyperglot
pkgver=0.2.9
pkgrel=3
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
makedepends=(python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0dc1795f275c11a112a2da01c1b9f50d22f9c58439732738cfbb74679e7e4db9')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
