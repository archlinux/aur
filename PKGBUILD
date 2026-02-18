# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-dgutils
pkgver=0.2
pkgrel=1
pkgdesc="A Python module with some universal classes and methods to provide shortcuts for some GTK operations"
arch=('any')
url="https://github.com/Dzheremi2/DGutils"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'python-gobject'
  'python-yaml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("DGutils-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e56b4b1869ec5e71610ac67611dba8e4850a5a67b5389f9be4ed2e8d49ccd2d')

build() {
  cd "DGutils-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "DGutils-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
