# Maintainer: Luis Marques <luigoalma at gmail dot com>

pkgname=python-haccrypto
pkgver=0.1.3
pkgrel=1
pkgdesc="Nintendo Switch XTSN crypto for Python"
arch=($CARCH)
license=(MIT)
url='https://github.com/luigoalma/haccrypto'
depends=('python')
optdepends=('openssl: for faster crypto operations')
makedepends=('python-setuptools')
source=("haccrypto-${pkgver}.tar.gz::https://github.com/luigoalma/haccrypto/archive/v${pkgver}.tar.gz")
sha256sums=('ecb9ca2253adc52841e7a06c359b10dd306ca3fc76d3d3dc0938bf38c234901c')
sha512sums=('d9fc745f33eb31c4e07eb924414e98d36098c42430412ead149e0dd0115cf745b6fb86bf739123e5aaa42d3f2a5ee4378c1d1e04c4568c4a652f84d5f9aa59f4')

build() {
	cd haccrypto-${pkgver}
	python setup.py build
}

package() {
	cd haccrypto-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

