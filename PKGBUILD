# Maintainer: Allan Chain <allan-chainatoutlookdotcom>
pkgname=sane-break
pkgver=0.2.1
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
sha256sums=('886591b42be483b7bb58631111bdf67b9c722c8c5b7298a5652415ad7fe94f77')

build() {
  cd "$pkgname-$pkgver"

  cmake .
  cmake --build . --parallel
}

package() {
  cd "$pkgname-$pkgver"

  cmake --install . --prefix "$pkgdir/usr"
}
