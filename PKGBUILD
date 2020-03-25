# Maintainer: Guillaume Horel <guillaume.horel@gmail.com
# Ex-Maintainer: Philipp A. <flying-sheep@web.de>

_name=unicodedata2
pkgname="python-$_name"
pkgver=13.0.0
_pkgver="$pkgver.post2"
pkgrel=1
pkgdesc='unicodedata backport/updates'
arch=('x86_64')
url="https://github.com/mikekap/$_name"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_name::1}/$_name/$_name-$_pkgver.tar.gz")
sha256sums=('a83e504fb0e8ed4757194e61c3f7b69fb3c914856057bea968d0950f80f947fa')

build() {
	cd "$srcdir/$_name-$_pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$_pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

check() {
    cd "${srcdir}/$_name-$_pkgver"
    python setup.py test
}
