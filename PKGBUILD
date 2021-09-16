# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-coinmarketcap
pkgver=5.0.3
pkgrel=2
pkgdesc="Python wrapper for coinmarketcap.com API"
arch=('any')
url="https://github.com/barnumbirr/coinmarketcap"
license=('Apache')
depends=('python-requests>=2.18.4' 'python-requests-cache>=0.4.13')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/coinmarketcap/coinmarketcap-$pkgver.tar.gz")
sha256sums=('1cfee31bf330a17cedf188e4e99588e6a4c6c969c93da71f55a9f4ec6a6c216f')

build() {
	cd "coinmarketcap-$pkgver"
	python setup.py build
}

package() {
	cd "coinmarketcap-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
