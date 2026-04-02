# Maintainer: xanderboy2001 <alexanderechristian@gmail.com>

pkgname=mc-creative-clone
pkgver=0.1.2
pkgrel=1
pkgdesc="Copies a Minecraft world and converts it to a creative mode backup"
arch=('any')
url="https://github.com/xanderboy2001/mc-creative-clone"
license=('GPL-3.0-or-later')
depends=(
  'python'
	'python-nbtlib'
  'python-questionary'
  'python-rich'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xanderboy2001/mc-creative-clone/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('494551aff7b13b7baa7d3adebe64ebc6db9d59dd2ecec55c1290de9b515ba962')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
