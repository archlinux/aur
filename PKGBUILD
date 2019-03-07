# Maintainer: Philipp A. <flying-sheep@web.de>
_name=pyahocorasick
pkgname=python-ahocorasick
pkgver=1.4.0
pkgrel=1
pkgdesc='Fast and memory efficient exact or approximate multi-pattern string search'
arch=(any)
url="http://pypi.python.org/pypi/$_name"
license=(BSD)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f9431a20e47e893cadd29f367825e882dbc6fc324a3c24c41e3ff9648e5d04b2')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1 || return 1
}
