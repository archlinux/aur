# Maintainer: Guillaume Horel <guillaume.horel@gmail.com
# Ex-Maintainer: Philipp A. <flying-sheep@web.de>

_name=unicodedata2
pkgname="python-$_name"
pkgver=12.0.0
pkgrel=1
pkgdesc='unicodedata backport/updates'
arch=('x86_64')
url="https://github.com/mikekap/$_name"
license=('Apache')
depends=('python')
source=("https://pypi.python.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d2eccba34ea5e1b4b3549391e1a10254577e7583f862a300e8f5665757564f77')

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
