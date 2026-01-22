# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-dgutils
pkgver=0.1
pkgrel=1
pkgdesc="GTK apps development easement"
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
sha256sums=('32ff339725a4508dabd3d68398c760017edcf61a8e4fd4df65fddfd0ca76b955')

build() {
  cd "DGutils-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "DGutils-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
