# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>

pkgname=python-binance
pkgver=1.0.37
pkgrel=1
pkgdesc="An unofficial Python wrapper for the Binance exchange REST API"
arch=('any')
url="https://github.com/sammchardy/$pkgname"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dateparser' 'python-pytz' 'python-requests' 'python-ujson' 'python-websockets' 'python-pycryptodome')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2e3a088a09b1dd37c0f9493a653443de30786d84376dae5a69296346c9adebd5e053798b9ff4b3551751cbd1d774b44cc09af23bdaf0e79203747ebd5a5f5988')

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
