# Contributor: Chris Singley <csingley@gmail.com>
# Maintainer: Chris Singley <csingley@gmail.com>
_projectname='ofxtools'
pkgname="python-$_projectname"
pkgver='0.9.4'
pkgrel='1'
pkgdesc='A Python library for working with Open Financial Exchange (OFX) data'
arch=('any')
url="https://github.com/csingley/ofxtools"
license=('GPL3')
depends=()
optdepends=()
makedepends=()
checkdepends=()
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://pypi.io/packages/source/o/$_projectname/$_projectname-$pkgver.tar.gz")
sha256sums=('e27f6c6f7ca2f8b195ee7fa14384760e2ea521d89501e6652e900aa4f92bff81')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
