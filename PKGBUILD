# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-pandas_market_calendars
_pkgname=${pkgname#python-}
pkgver=4.6.1
pkgrel=2
pkgdesc="Market and exchange trading calendars for pandas"
arch=('any')
depends=('python-pytz' 'python-pandas' 'python-exchange_calendars' 'python-dateutil' 'python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
url="https://github.com/rsheftel/$_pkgname"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('cc17e3ccb07548603cf8dbd7050c83f8d6ee9ddf3987a05e1dceab53793a0da8')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
