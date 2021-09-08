# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-srtools
_name=${pkgname#python-}
pkgver=0.1.10
pkgrel=1
pkgdesc="Commandline utility and Python package for Cyrillic ↔ Latin transliteration of Serbian Language"
url="https://gitlab.com/andrejr/srtools"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('953812a8ecd0d2b0d358877508a9c972cbc0d7a57a647aa1d3f0f486c26a455b')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
