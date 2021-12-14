# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbntools
_pyname="${pkgname#python-}"
pkgver=4.3.25
pkgrel=2
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=(any)
url="https://pypi.python.org/pypi/$_pyname"
license=(LGPL3)
depends=(python
         python-isbnlib)
makedepends=(python-setuptools)
_archive="$_pyname-$pkgver"
source=("$_archive.tar.gz::https://github.com/xlcnd/$_pyname/archive/v$pkgver.tar.gz")
sha256sums=('24a586e28d16b9342a9521a707319874f0e2e5e5c9c6d0ceddef66cee36ba5d8')

build() {
	cd "$_archive"
	python setup.py build
}

package(){
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
