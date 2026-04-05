# Maintainer: xanderboy2001 <alexanderechristian@gmail.com>

pkgname=mc-creative-clone
pkgver=0.2.0
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
sha256sums=('818f2ea3771e078e391805d57a66779e6b87afada2c8ff757b5aad2b23fcb52c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
