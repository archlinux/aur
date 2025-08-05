# Maintainer: Allan Chain <allan-chainatoutlookdotcom>
pkgname=sane-break
pkgver=0.9.0
pkgrel=1
pkgdesc="A gentle break reminder that helps you avoid mindlessly skipping breaks."
arch=('x86_64')
url="https://github.com/AllanChain/sane-break"
license=('GPL-3.0-or-later')
depends=(
  "qt6-base"
  "qt6-multimedia"
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
sha256sums=('bceb564c034d81feccdc53915775237344adb31effff97d2bf960982b7239acb')

build() {
  cd "$pkgname-$pkgver"

  cmake .
  cmake --build . --parallel
}

package() {
  cd "$pkgname-$pkgver"

  cmake --install . --prefix "$pkgdir/usr"
}
