# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>

pkgname=python-binance
pkgver=1.0.32
pkgrel=1
pkgdesc="An unofficial Python wrapper for the Binance exchange REST API"
arch=('any')
url="https://github.com/sammchardy/$pkgname"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dateparser' 'python-pytz' 'python-requests' 'python-ujson' 'python-websockets' 'python-pycryptodome')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d746612c399ca94e41701305ad43978736149b898403199ab52d0844c870a8f1bd6102fe77af57fb3a2b8d30cbb516e1025d5baf8d5eb5b98acd769581f389e8')

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
