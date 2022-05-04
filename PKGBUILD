# Maintainer: fsyy <fossy2001 @ web.de>
pkgname=python-elgato-streamdeck
pkgver=0.9.1
pkgrel=1
pkgdesc="Library to control Elgato Stream Deck devices"
arch=('any')
url="https://github.com/abcminiuser/python-elgato-streamdeck"
license=('MIT')
depends=('python-pillow')
makedepends=('python-setuptools')
provides=('streamdeck')
source=("https://github.com/abcminiuser/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('8fc4a22a56f1fe3520b389f5c570cb8bd6bc4ccfdc24b85036685bbf3babfb4ed99c523cf67fa26e7e1a1bf2cd8d874d9efb3923c5811df2a52045041107dce4')

build() {
	cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
