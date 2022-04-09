# Maintainer: 0b100100 <0b100100 at protonmail dot ch>

pkgname=python-binance
pkgver=1.0.16
pkgrel=1
pkgdesc="An unofficial Python wrapper for the Binance exchange REST API"
arch=('any')
url="https://github.com/sammchardy/python-binance"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dateparser' 'python-pytz'
         'python-requests' 'python-ujson' 'python-websockets')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3a0c7ae866dd34126db6dca137a1b2f587acd561ff1531725cb7eba0a0d1ee240c85316c2b2820caeda9a942e751ecafd3076a2bdfa4f9e21ddf80fa12bb329e')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  pytest
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
