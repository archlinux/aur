# Maintainer: 0b100100 <0b100100 at protonmail dot ch>

pkgname=python-binance
pkgver=1.0.15
pkgrel=1
pkgdesc="An unofficial Python wrapper for the Binance exchange REST API"
arch=('any')
url="https://github.com/sammchardy/python-binance"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dateparser'
         'python-requests' 'python-ujson' 'python-websockets=9.1')
makedepends=('python-setuptools')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/sammchardy/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('38ebb268a94b2c5073a84995474bbb662e17258fa0d5e9ec82c2d57a3b2f01f0')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
