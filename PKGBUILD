# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-pandas_market_calendars'
_pkgname=${pkgname#python-}
pkgver=0.16
pkgrel=1
pkgdesc="Market and exchange trading calendars for pandas"
arch=('any')
depends=('python-six' 'python-pytz' 'python-pandas')
makedepends=('python-setuptools')
url="https://github.com/rsheftel/$_pkgname"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a9e43d5bace442afa7069058ea06e185082c89bda7f7a22c013885dec2f352f0')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
