# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

_pipname=isbnlib
pkgname=python-$_pipname
pkgver=3.10.6
pkgrel=1
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=('any')
url="https://pypi.python.org/pypi/$_pipname"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xlcnd/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('aeded24f74e8c5876dbb36c598b4b9ab53faba208b87beca1c1891fa5f8b08ac')

build() {
	cd "$_pipname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
