# Maintainer: John Lindgren <john@jlindgren.net>

pkgname=qmpanel
pkgver=0.5
pkgrel=1
pkgdesc="A Minimal Qt-Based Desktop Panel"
arch=("x86_64")
url="https://github.com/jlindgren90/qmpanel"
license=("LGPL2.1")
makedepends=(
  "meson"
  "cmake" # needed to find layer-shell-qt
)
depends=(
  "glib2"
  "kwindowsystem"
  "layer-shell-qt"
  "libxcb"
)

source=("https://github.com/jlindgren90/qmpanel/archive/qmpanel-$pkgver.tar.gz")
sha256sums=("010541af51814f79f4a94df1c06dd5d4922973b0ba2e198a2f26a4e7a9bb709b")

build() {
  arch-meson qmpanel-qmpanel-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
