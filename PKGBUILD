# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-srtools
_name=${pkgname#python-}
pkgver=0.1.13
pkgrel=1
pkgdesc="Commandline utility and Python package for Cyrillic ↔ Latin transliteration of Serbian Language"
url="https://gitlab.com/andrejr/srtools"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6f9b51ab64e1d8a5609b12a1bdea7d6b1908f2269210ed85f0097b0200aa4a69')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
