# Maintainer: fsyy <fossy2001 @ web.de>
pkgname=python-elgato-streamdeck
pkgver=0.8.4
pkgrel=1
pkgdesc="Library to control Elgato Stream Deck devices"
arch=('any')
url="https://github.com/abcminiuser/python-elgato-streamdeck"
license=('MIT')
depends=('python-pillow')
makedepends=('python-setuptools')
provides=('streamdeck')
source=("https://github.com/abcminiuser/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('02337e32993237e433747b4dded8cf4d2d9c3ee1e2d62110dbb765c8a7c158882262d1872cd15c3151e4a03bc3f3a49753760f78f668bfcbe46e03fcd25bc72e')

build() {
	cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
