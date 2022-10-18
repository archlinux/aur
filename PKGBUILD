# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

_pipname=isbnlib
pkgname=python-$_pipname
pkgver=3.10.11
pkgrel=1
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=(any)
url="https://pypi.python.org/pypi/$_pipname"
license=(LGPL3)
depends=(python)
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
_archive="$_pipname-$pkgver"
source=("$_archive.tar.gz::https://github.com/xlcnd/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('914fe71b97c1de04df2d15c7590b28d65b22bab2ff4871ee287cfc3cb9fe25f4')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
