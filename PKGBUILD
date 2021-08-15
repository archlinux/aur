# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-pandas_market_calendars
_pkgname=${pkgname#python-}
pkgver=2.1
pkgrel=1
pkgdesc="Market and exchange trading calendars for pandas"
arch=('any')
depends=('python-pytz' 'python-pandas' 'python-exchange_calendars')
makedepends=('python-setuptools')
url="https://github.com/rsheftel/$_pkgname"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('61b0eb51f9e6f1fb6bbdb110bf42a0940ef35fb652dba8973a02d7d3050baba0')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
