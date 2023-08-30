# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pytest-pudb
pkgver=0.8.0
pkgrel=1
pkgdesc="Pytest plugin for PuDB debugger integration"
url="https://github.com/stdedos/pytest-pudb"
arch=('any')
license=('MIT')
depends=('python-pytest' 'python-pudb')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=(
  "git+https://github.com/stdedos/pytest-pudb.git#tag=v$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
  cd "pytest-pudb"
  python -m build --no-isolation --wheel
}

package() {
  cd "pytest-pudb"
  python -m installer --destdir="$pkgdir" "dist/pytest_pudb-$pkgver"-*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
