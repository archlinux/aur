# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-pandas_market_calendars
_pkgname=${pkgname#python-}
pkgver=1.7
pkgrel=1
pkgdesc="Market and exchange trading calendars for pandas"
arch=('any')
depends=('python-pytz' 'python-pandas' 'python-trading_calendars')
makedepends=('python-setuptools')
url="https://github.com/rsheftel/$_pkgname"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('706e5a9fac3e7722fa5875a230a0abc813128ffff3f36064da676b445017575d')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
