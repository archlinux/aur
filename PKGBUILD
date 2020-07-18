# Maintainer: hexptr <hexptr@protonmail.com>
pkgname=python-elgato-streamdeck
pkgver=0.8.1
pkgrel=1
pkgdesc="Library to control Elgato Stream Deck devices"
arch=('any')
url="https://github.com/abcminiuser/python-elgato-streamdeck"
license=('MIT')
depends=('python-pillow')
makedepends=('python-setuptools')
provides=('streamdeck')
source=("https://github.com/abcminiuser/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c65b90ab0ee5c6e17a6f7af670c54a12c96b705ef4bec359a51ba6671a3908626a9658f5a5829266102fa249628b82ee04c525db995f4984f26f802620598e6c')

build() {
	cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
