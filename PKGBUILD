# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbntools
_pyname="${pkgname#python-}"
pkgver=4.3.28
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=(any)
url="https://pypi.python.org/pypi/$_pyname"
license=(LGPL3)
depends=(python
         python-isbnlib)
makedepends=(python-setuptools)
_archive="$_pyname-$pkgver"
source=("$_archive.tar.gz::https://github.com/xlcnd/$_pyname/archive/v$pkgver.tar.gz")
sha256sums=('8d5dd48eca3056e9952420e141d2c1057792366f9814cce1fe5dbba486f804a6')

build() {
	cd "$_archive"
	python setup.py build
}

package(){
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
