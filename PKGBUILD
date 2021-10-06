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
sha512sums=('2b059b763a380e9fe2529a6a9621acbbd180594ea54f1310ba0a8e266373ce1b13a9138bddd8232a77f1265216e0c3d5cb45e4a0c13840929a4e99c41a83829a')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
