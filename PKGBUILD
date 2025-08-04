# Maintainer: none
# Contributor: tarball <bootctl@gmail.com>

pkgname=bagels
pkgver=0.3.12
pkgrel=1
pkgdesc='Powerful terminal expense tracker'
arch=('any')
url='https://github.com/EnhancedJax/Bagels'
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-click'
  'python-dateutil'
  'python-linkify-it-py'
  'python-numpy'
  'python-packaging'
  'python-plotext'
  'python-pydantic'
  'python-requests'
  'python-rich'
  'python-sqlalchemy'
  'python-textual'
  'python-typing_extensions'
  'python-xdg-base-dirs'
  'python-yaml'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('225c46ebc9977ad6cd3b03d43e1e8901c7811bd6fb8d316f16b236c60a7fed69')

build() {
  cd "Bagels-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "Bagels-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
