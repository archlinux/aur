# Maintainer: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>

pkgname=python2-stomper
_libname=${pkgname/python2-/}
pkgver=0.3.0
pkgrel=1
pkgdesc="A transport neutral client implementation of the STOMP protocol."
arch=('any')
url="https://github.com/oisinmulvihill/stomper"
license=('apache')
depends=('python2')
provides=('stomper')
replaces=('stomper')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz")

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('ceaacc016c0e8e98c3d3155f22069d18d403637d57492d9cf678813e27c9ecb0')
