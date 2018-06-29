# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-schematics
pkgver=2.1.0
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Python Data Structures for Humans"
url="https://github.com/schematics/schematics"
makedepends=('python2-setuptools')
provides=('python2-dictshield')
replaces=('python2-dictshield')
license=('BSD')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
sha256sums=('a40b20635c0e43d18d3aff76220f6cd95ea4decb3f37765e49529b17d81b0439')

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
