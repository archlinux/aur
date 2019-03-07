# Maintainer: Philipp A. <flying-sheep@web.de>
_name=pyahocorasick
pkgname=python-ahocorasick
pkgver=1.1.6
pkgrel=2
pkgdesc='Fast and memory efficient exact or approximate multi-pattern string search'
arch=(any)
url="http://pypi.python.org/pypi/$_name"
license=(BSD)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6bb71feccd515584edfb6923cd9e5c143da11cf0f7ffbc3c7d3eb2912cbd2026')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1 || return 1
}
