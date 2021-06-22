# Maintainer: Luis Marques <luigoalma at gmail dot com>

pkgname=python-haccrypto
pkgver=0.1.1
pkgrel=1
pkgdesc="Nintendo Switch XTSN crypto for Python"
arch=($CARCH)
license=(MIT)
url='https://github.com/luigoalma/haccrypto'
depends=('python')
optdepends=('openssl: for faster crypto operations')
makedepends=('python-setuptools')
source=("haccrypto-${pkgver}.tar.gz::https://github.com/luigoalma/haccrypto/archive/v${pkgver}.tar.gz")
sha256sums=('85f9559ab6b54529cc5aefe0fd899211bc123e5b4666293d25997b1291688074')
sha512sums=('c18a983f3c5eafbd3f62eb03f6abddd1d193bf21497d4e904c3d79fece37e34f3a295bf5cd6239bd8aa245e9fa611aa9826cc39e35c6d3acc691c1d603fd8cee')

build() {
	cd haccrypto-${pkgver}
	python setup.py build
}

package() {
	cd haccrypto-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

