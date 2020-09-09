pkgname=python-haccrypto
pkgver=0.1.0
pkgrel=2
pkgdesc="Nintendo Switch XTSN crypto for Python"
arch=($CARCH)
license=(MIT)
url='https://github.com/luigoalma/haccrypto'
depends=('python')
makedepends=('python-setuptools')
source=("haccrypto-${pkgver}.tar.gz::https://github.com/luigoalma/haccrypto/archive/v${pkgver}.tar.gz")
sha256sums=('bdac0bb995743dbbeede9c63277ee09b2419183f14897883267515b2e822fc26')
sha512sums=('6d82c166ccf28be9d5416ad2487b686c247eb0a7ae8b80827bdc48170523b1b9ec584c74985cfc4d48983572f82da96bea2249e791a8695e76b3e9c7c7239f93')

build() {
	cd haccrypto-${pkgver}
	python setup.py build
}

package() {
	cd haccrypto-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

