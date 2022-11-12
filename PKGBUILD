# Maintainer: fsyy <fossy2001 @ web.de>
pkgname=python-elgato-streamdeck
pkgver=0.9.3
pkgrel=1
pkgdesc="Library to control Elgato Stream Deck devices"
arch=('any')
url="https://github.com/abcminiuser/python-elgato-streamdeck"
license=('MIT')
depends=('python-pillow')
makedepends=('python-setuptools')
provides=('streamdeck')
source=("https://github.com/abcminiuser/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('96e9765fb6d579b692a2aa55b19bb82d4145821a3eee05adbc30409b319aca36c6afd783df22f1b33f0532a392e6b7609c047eb3bfb4d22af5cec01d3ddebf71')

build() {
	cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
