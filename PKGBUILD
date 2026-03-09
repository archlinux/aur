pkgname=stockstui
pkgver=0.1.0b12
_upstream_ver=0.1.0-b12
pkgrel=1
pkgdesc="Terminal UI for stocks, crypto, news, and charts"
arch=('any')
url='https://github.com/andriy-git/stocksTUI'
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-dateutil'
  'python-pandas'
  'python-pandas_market_calendars'
  'python-plotext'
  'python-requests'
  'python-textual'
  'python-textual-plotext'
  'python-yfinance'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/andriy-git/stocksTUI/archive/refs/tags/v${_upstream_ver}.tar.gz")
sha256sums=('d5c5bfd363317591ebd704e51691e1db4abc1c0b6eedeba1cc2a1ed6fd0c2bea')

build() {
  cd "stocksTUI-${_upstream_ver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "stocksTUI-${_upstream_ver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
