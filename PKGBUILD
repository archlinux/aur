# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>

pkgname=python-binance
pkgver=1.0.26
pkgrel=1
pkgdesc="An unofficial Python wrapper for the Binance exchange REST API"
arch=('any')
url="https://github.com/sammchardy/$pkgname"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dateparser' 'python-pytz' 'python-requests' 'python-ujson' 'python-websockets' 'python-pycryptodome')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('36fc813c4609395b263c4a90662186d3c5ba3567f2c4bad49ef45b61aa6cd5248dd057791c4c8e2b7c72b0da6de4ddbf3081207adff415aa43f093844285f36f')

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
