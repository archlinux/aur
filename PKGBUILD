# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=python-aiomanhole
_pkgname=aiomanhole
pkgver=0.4.2
pkgrel=1
pkgdesc='Manhole for accessing asyncio applications'
url='https://github.com/nathan-hoad/aiomanhole'
arch=('any')
license=('Apache')
depends=('python>=3.3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('89418ccb2b3aa28125e0bce944e4cf35a4de01efb42181110b8653385398a4d7')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
