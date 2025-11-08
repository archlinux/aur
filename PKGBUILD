# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-korean_lunar_calendar'
_pkgname=${pkgname#python-}
pkgver=0.3.1
pkgrel=3
pkgdesc="Library to convert Korean lunar-calendar to Gregorian calendar"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/usingsky/korean_lunar_calendar_py"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('eb2c485124a061016926bdea6d89efdf9b9fdbf16db55895b6cf1e5bec17b857')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
