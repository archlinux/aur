# Maintainer: Phil Schaf <flying-sheep@web.de>

_name=aiomanhole
pkgname=python-$_name
pkgver=0.6.0
pkgrel=1
pkgdesc='Manhole for accessing asyncio applications'
url="https://github.com/nathan-hoad/$_name"
arch=('any')
license=('Apache')
depends=('python>=3.3')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3efc7e1655d0ad623c556297f8cca90a4c5d8bb76dc53bf6ad5f10cc4b0d571d')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
