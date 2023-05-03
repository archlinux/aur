# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbntools
_pyname="${pkgname#python-}"
pkgver=4.3.28
pkgrel=2
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=(any)
url="https://pypi.python.org/pypi/$_pyname"
license=(LGPL3)
depends=(python
         python-isbnlib)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://github.com/xlcnd/$_pyname/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('8d5dd48eca3056e9952420e141d2c1057792366f9814cce1fe5dbba486f804a6')

build() {
	cd "$_archive"
	python -m build -wn
}

package(){
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
