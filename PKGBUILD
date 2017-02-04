# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=python-aiomanhole
_pkgname=aiomanhole
pkgver=0.3.0
pkgrel=1
pkgdesc='Manhole for accessing asyncio applications'
url='https://github.com/nathan-hoad/aiomanhole'
arch=('any')
license=('Apache')
depends=('python>=3.3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('f7116d11a045c8c78a2c374cf1eedf3c')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
