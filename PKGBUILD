# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-pandas_market_calendars'
_pkgname=${pkgname#python-}
pkgver=1.5.0
pkgrel=1
pkgdesc="Market and exchange trading calendars for pandas"
arch=('any')
depends=('python-pytz' 'python-pandas')
makedepends=('python-setuptools')
url="https://github.com/rsheftel/$_pkgname"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3102ee0af4f5ed14dd2fcf4579df1da8801de4660aad8e10c62656f1bf21d4c8')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
