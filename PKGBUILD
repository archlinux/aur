# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-couleur
pkgver=0.6.2
pkgrel=1
pkgdesc="ANSI terminal tool for python, colored shell and other handy fancy features"
url="https://github.com/gabrielfalcao/couleur"
license=(APACHE)
depends=('python-setuptools')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/couleur/couleur-$pkgver.tar.gz")

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

sha256sums=('61a2b28bf9a5dd44e827c4afb28a8b0082cf196c2984cc408b9b93f3b1ef0ae3')
