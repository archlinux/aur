# Maintainer: Allan Chain <allan-chainatoutlookdotcom>
pkgname=sane-break
pkgver=0.2.0
pkgrel=1
pkgdesc="A polite and sane break reminder preventing mindless skips."
arch=('x86_64')
url="https://github.com/AllanChain/sane-break"
license=('GPL-3.0-or-later')
depends=(
  "qt6-base"
  "hicolor-icon-theme" # needed for hicolor theme hierarchy
  "libx11"
  "libxss"
  "wayland"
  "layer-shell-qt"
)
makedepends=(
  "cmake"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('125d9148d0cb952ce0c01689193330d7337003b7c0fbebfe496254279e9a6379')

build() {
  cd "$pkgname-$pkgver"

  cmake .
  cmake --build . --parallel
}

package() {
  cd "$pkgname-$pkgver"

  cmake --install . --prefix "$pkgdir/usr"
}
