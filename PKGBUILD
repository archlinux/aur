# Maintainer: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>

pkgname=python2-stomper
_libname=${pkgname/python2-/}
pkgver=0.4.1
pkgrel=1
pkgdesc="A transport neutral client implementation of the STOMP protocol."
arch=('any')
url="https://github.com/oisinmulvihill/stomper"
license=('apache')
depends=('python2')
provides=('stomper')
replaces=('stomper')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz")

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('3b3f1238579fcbb7d79dd3e32d22caadf419e3a73c18f40672ab8dbbeef692e1')
