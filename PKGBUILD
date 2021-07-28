# Maintainer: fsyy <fossy2001 @ web.de>
pkgname=python-elgato-streamdeck
pkgver=0.8.5
pkgrel=1
pkgdesc="Library to control Elgato Stream Deck devices"
arch=('any')
url="https://github.com/abcminiuser/python-elgato-streamdeck"
license=('MIT')
depends=('python-pillow')
makedepends=('python-setuptools')
provides=('streamdeck')
source=("https://github.com/abcminiuser/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2ca02b45246b45b6aa9e7bdf78064274d55507fe551ee28aaf5d6c379ade5be5a89d0b9fd647cf81269c2f708a38f7a1ac46783211479ddc7752263f4bc5dd96')

build() {
	cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
