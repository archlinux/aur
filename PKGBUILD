# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-pandas_market_calendars'
_pkgname=${pkgname#python-}
pkgver=1.3.5
pkgrel=1
pkgdesc="Market and exchange trading calendars for pandas"
arch=('any')
depends=('python-six' 'python-pytz' 'python-pandas')
makedepends=('python-setuptools')
url="https://github.com/rsheftel/$_pkgname"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('1a301ebfc500dd41f1bdbda87e676018019574aeba4aa05b0666f27b5f372998')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
