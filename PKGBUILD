# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-pandas_market_calendars
_pkgname=${pkgname#python-}
pkgver=2.0
pkgrel=2
pkgdesc="Market and exchange trading calendars for pandas"
arch=('any')
depends=('python-pytz' 'python-pandas' 'python-exchange_calendars')
makedepends=('python-setuptools')
url="https://github.com/rsheftel/$_pkgname"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('656b371a001234a3db368d418bddeb57805e5c95b59d94041e87bc976d4fc463')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
