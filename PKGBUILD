# Maintainer: Philipp A. <flying-sheep@web.de>
_pypiname=pyahocorasick
pkgname=python-ahocorasick
pkgver=1.1.6
pkgrel=1
pkgdesc='Fast and memory efficient exact or approximate multi-pattern string search'
arch=(any)
url="http://pypi.python.org/pypi/$_pypiname"
license=(BSD)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('6bb71feccd515584edfb6923cd9e5c143da11cf0f7ffbc3c7d3eb2912cbd2026')

build() {
	cd "$srcdir/$_pypiname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pypiname-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1 || return 1
}
