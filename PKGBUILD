# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-pandas_market_calendars'
_pkgname=${pkgname#python-}
pkgver=0.15
pkgrel=1
pkgdesc="Market and exchange trading calendars for pandas"
arch=('x86_64')
depends=('python-six' 'python-pytz' 'python-pandas')
makedepends=('python-setuptools')
url="https://github.com/rsheftel/pandas_market_calendars"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('9a5d62e447a4a971165a9b849875bb2e44fc46dfaf87321fa41b1d0ff2dc4171')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
