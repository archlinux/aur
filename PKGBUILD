# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

_pipname=isbnlib
pkgname=python-$_pipname
pkgver=3.10.0
pkgrel=1
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=('any')
url="https://pypi.python.org/pypi/$_pipname"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xlcnd/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('e9ed6aee7dafafd457d07d5ddc1adde631f5cef9aeb33db324da7c61c75c182d')

build() {
	cd "$_pipname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
