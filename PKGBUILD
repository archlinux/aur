# Maintainer: Guillaume Horel <guillaume.horel@gmail.com
# Ex-Maintainer: Philipp A. <flying-sheep@web.de>

_name=unicodedata2
pkgname="python-$_name"
pkgver=12.1.0
pkgrel=1
pkgdesc='unicodedata backport/updates'
arch=('x86_64')
url="https://github.com/mikekap/$_name"
license=('Apache')
depends=('python')
source=("https://pypi.python.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c86829393d1fba1b306e26fa46852c9841a7342ca9131909e5e44df7af959946')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

#check() {
    #cd "${srcdir}/$_name-$pkgver"
    #python setup.py test
#}
