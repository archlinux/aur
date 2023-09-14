# Maintainer: fsyy <fossy2001 @ web.de>
pkgname=python-elgato-streamdeck
pkgver=0.9.4
pkgrel=1
pkgdesc="Library to control Elgato Stream Deck devices"
arch=('any')
url="https://github.com/abcminiuser/python-elgato-streamdeck"
license=('MIT')
depends=('python-pillow')
makedepends=('python-setuptools')
provides=('streamdeck')
source=("https://github.com/abcminiuser/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('b232927a1d95a71d1985c361b2c6b886d7cd0efb3f1fb30bc4a84ded8b025e98dbd43dd74f3be8dd6734e7e8d3efa22a2413705d6de375115d5421d6f6e698f6')

build() {
	cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
