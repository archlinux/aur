# Maintainer: Philipp A. <flying-sheep@web.de>
_name=pyahocorasick
pkgname=python-ahocorasick
pkgver=1.4.2
pkgrel=1
pkgdesc='Fast and memory efficient exact or approximate multi-pattern string search'
arch=(any)
url="http://pypi.python.org/pypi/$_name"
license=(BSD)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('88f79307c74ae6a84f8d88c2522a082f1d21c425762aba7f7e4d14dd431d2fb7')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1 || return 1
}
