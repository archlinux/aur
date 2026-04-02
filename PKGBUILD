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
sha256sums=('f6fc70456c8032623c0b74ff72b61d324700222cebf4b3f5dcacc3701a349771')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
