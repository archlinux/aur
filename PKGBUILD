# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

_pipname=isbnlib
pkgname=python-$_pipname
pkgver=3.10.9
pkgrel=2
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=(any)
url="https://pypi.python.org/pypi/$_pipname"
license=(LGPL3)
depends=(python)
makedepends=(python-setuptools)
_archive="$_pipname-$pkgver"
source=("$_archive.tar.gz::https://github.com/xlcnd/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('3d6c11a46fa0672592cbc0bb1135e30f5653824f5bddec0bb1dd3626b6b2f942')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
