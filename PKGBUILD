# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>

pkgname=python-binance
pkgver=1.0.36
pkgrel=1
pkgdesc="An unofficial Python wrapper for the Binance exchange REST API"
arch=('any')
url="https://github.com/sammchardy/$pkgname"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dateparser' 'python-pytz' 'python-requests' 'python-ujson' 'python-websockets' 'python-pycryptodome')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('991cbc92563dc019edee40682db81ab56f91007e64ac1ab13578a6dccdf8f0dbbc19df2c52e16c40667032ebf864023be5d5779f1afc22e50c475ceef2c6f74b')

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
