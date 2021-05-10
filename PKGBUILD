# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

_pipname=isbnlib
pkgname=python-$_pipname
pkgver=3.10.8
pkgrel=1
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=('any')
url="https://pypi.python.org/pypi/$_pipname"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xlcnd/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('df90f108ef72efee40261343cd3fe7cace1f9358708e49bc2526a293478d37fd')

build() {
	cd "$_pipname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
