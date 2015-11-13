# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-couleur
pkgver=0.6.1
pkgrel=1
pkgdesc="ANSI terminal tool for python, colored shell and other handy fancy features"
url="https://github.com/gabrielfalcao/couleur"
license=(APACHE)
depends=('python-setuptools')
arch=('any')
source=("https://pypi.python.org/packages/source/c/couleur/couleur-$pkgver.tar.gz")

prepare() {
	cd "$srcdir/couleur-$pkgver"
	2to3 -nw .
}

build() {
	cd "$srcdir/couleur-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/couleur-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('6bc07462df223fbf6bfc6fa7106da633fcd7acf895a7003676126c7b347491c8')
