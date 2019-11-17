# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-srtools
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="Commandline utility and Python package for Cyrillic ↔ Latin transliteration of Serbian Language"
url="https://gitlab.com/andrejr/srtools"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('694e7329e9ad3439a5e5ee4fb627f199804b3e5d1da267f7694d8602946f9bb8')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
