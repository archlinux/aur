# Maintainer: fsyy <fossy2001 @ web.de>
pkgname=python-elgato-streamdeck
pkgver=0.9.0
pkgrel=2
pkgdesc="Library to control Elgato Stream Deck devices"
arch=('any')
url="https://github.com/abcminiuser/python-elgato-streamdeck"
license=('MIT')
depends=('python-pillow')
makedepends=('python-setuptools')
provides=('streamdeck')
source=("https://github.com/abcminiuser/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('c6a8a50e700f8bd58b0585564593a241ea3c0299714b03b32b22771652af6f75a9e4bf9118939091d2b5d03d8f0ca3d3a15689df4c7ed459c590f9c076d7abdb')

build() {
	cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
