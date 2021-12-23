# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-korean_lunar_calendar'
_pkgname=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="Library to convert Korean lunar-calendar to Gregorian calendar"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/usingsky/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('12ce54b1392ed45a82dc6cea85ee5f7e33630556e82488f57e37a22482c8275d')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
