# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-mailer
_libname=${pkgname/python2-/}
pkgver=0.7
pkgrel=2
pkgdesc="A module that simplifies sending email."
arch=('any')
url='http://pypi.python.org/pypi/mailer'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/m/mailer/mailer-$pkgver.zip")

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('294097bdd3698d1268b3bc07d90b3b47b56cce47c61a394322ac68f9fee0f8f3')
