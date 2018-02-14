# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-pandas_market_calendars'
_pkgname=${pkgname#python-}
pkgver=0.14
pkgrel=1
pkgdesc="Market and exchange trading calendars for pandas"
arch=('x86_64')
depends=('python-six' 'python-pytz' 'python-pandas')
makedepends=('python-setuptools' 'python-six' 'python-pytz' 'python-pandas')
url="https://github.com/rsheftel/pandas_market_calendars"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3b120e85336bc04f773bf271806d7adfb3a19a7f1c4378da2a771083ec5d2af2')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
