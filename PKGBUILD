# Maintainer: Matthew Gamble
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=python-tabulate
pkgver=0.7.5
pkgrel=1
pkgdesc="Pretty-print tabular data in Python."
arch=("any")
license=("MIT")
url="https://bitbucket.org/astanin/python-tabulate"
depends=("python")
source=("https://pypi.python.org/packages/source/t/tabulate/tabulate-${pkgver}.tar.gz")
sha256sums=('9071aacbd97a9a915096c1aaf0dc684ac2672904cd876db5904085d6dac9810e')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
