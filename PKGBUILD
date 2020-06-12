# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

_pipname=isbnlib
pkgname=python-$_pipname
pkgver=3.10.3
pkgrel=1
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=('any')
url="https://pypi.python.org/pypi/$_pipname"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xlcnd/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('9ba0bef962c9911fee9e7f0009f8e2958f11fec715f5ee9415ad38b6ab757827')

build() {
	cd "$_pipname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
