# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbntools
_pyname="${pkgname#python-}"
pkgver=4.3.29
pkgrel=3
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=(any)
url="https://pypi.python.org/pypi/$_pyname"
license=(LGPL-3.0-only)
depends=(python
         python-isbnlib)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://github.com/xlcnd/$_pyname/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('1d44597f5b45d8f4c689265030a986f0c58d0ff90cea11ad642c3d063d7b3fcf')

build() {
	cd "$_archive"
	python -m build -wn
}

package(){
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
