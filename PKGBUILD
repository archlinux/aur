# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>

pkgname=python-binance
pkgver=1.0.19
pkgrel=1
pkgdesc="An unofficial Python wrapper for the Binance exchange REST API"
arch=('any')
url="https://github.com/sammchardy/$pkgname"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dateparser' 'python-pytz' 'python-requests' 'python-ujson' 'python-websockets' 'python-pycryptodome')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e62485c6515b3bde696d3a9ef35300fb67ea40a6958d70781c77b77e52a834c2e5e6d7dc6287606b142dd37779a21af213fa85504fceea49cdd4729ca1ff6342')

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
