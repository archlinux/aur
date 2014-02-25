# Maintainer: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>

pkgname=python2-stomper
_libname=${pkgname/python2-/}
pkgver=0.2.8
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

sha256sums=('30403340c97ca463bddba7385cefc81cd0f279ebe06309fddf4c65b412575e91')
