# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-mailer
_libname=${pkgname/python2-/}
pkgver=0.8.1
pkgrel=1
pkgdesc="A module that simplifies sending email."
arch=('any')
url='http://pypi.python.org/pypi/mailer'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/m/mailer/mailer-$pkgver.zip")

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('3411a12197731e0d5379ab194d9acc8d0d71c8b95fdfb11474d67c3e9860070e')
