# Maintainer: Allan Chain <allan-chainatoutlookdotcom>
pkgname=sane-break
pkgver=0.8.1
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
sha256sums=('0fa4408ec43e9ad89d937a73cc2dd74552e4f9453379c315935866a7968845c0')

build() {
  cd "$pkgname-$pkgver"

  cmake .
  cmake --build . --parallel
}

package() {
  cd "$pkgname-$pkgver"

  cmake --install . --prefix "$pkgdir/usr"
}
