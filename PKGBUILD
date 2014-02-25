# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-schematics
pkgver=0.9_4
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Python Data Structures for Humans"
url="https://github.com/j2labs/schematics"
makedepends=('python2-setuptools')
provides=('python2-dictshield')
replaces=('python2-dictshield')
license=('BSD')
arch=('any')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-${pkgver//_/-}.tar.gz)

build() {
	cd "$srcdir/$_libname-${pkgver//_/-}"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-${pkgver//_/-}"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('05a688904d010ee090c59894b66aa1104ea4e043fe165c05dbd7f53e49120d08')
