# Maintainer: Luis Marques <luigoalma at gmail dot com>

pkgname=python-haccrypto
pkgver=0.1.2
pkgrel=1
pkgdesc="Nintendo Switch XTSN crypto for Python"
arch=($CARCH)
license=(MIT)
url='https://github.com/luigoalma/haccrypto'
depends=('python')
optdepends=('openssl: for faster crypto operations')
makedepends=('python-setuptools')
source=("haccrypto-${pkgver}.tar.gz::https://github.com/luigoalma/haccrypto/archive/v${pkgver}.tar.gz")
sha256sums=('2b767f7150d69710af8cb461710cfaac3436f17e36a979c0b0abc63f59978ec7')
sha512sums=('6bdca27076a7c17bb1ed4e648add093f7828cf5f44a1e6e7f066be4253cc42f712f7d02bfce3ffd225f0ad70ca8de872ffa2c81915ff429f2971ec58993e175f')

build() {
	cd haccrypto-${pkgver}
	python setup.py build
}

package() {
	cd haccrypto-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

