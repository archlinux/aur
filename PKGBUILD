# Maintainer: robertfoster

pkgname=python-pyelliptic
pkgver=2.0.1
pkgrel=2
pkgdesc="Python OpenSSL wrapper for ECC (ECDSA, ECIES), AES, HMAC, Blowfish, ..."
arch=(any)
url="https://github.com/radfish/pyelliptic"
license=('GPL3')
depends=('openssl')
makedepends=('python-setuptools')
source=(https://github.com/radfish/pyelliptic/archive/$pkgver.tar.gz)

build() {
	cd ${pkgname##python-}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname##python-}-${pkgver}
	python setup.py install --root="$pkgdir" --skip-build
}

sha256sums=('840ad6f5e79c633e1de79fb08be78bf76fe07a7f260905eea31efb5ddf00180d')
