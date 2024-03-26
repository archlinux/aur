# Maintainer: John Lindgren <john@jlindgren.net>

pkgname=qmpanel
pkgver=0.4
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
sha256sums=("501e0307e6ec096452e66fecfecc7149f6aa593d2cb37d2c3fcdc2b0d29c9af8")

build() {
  arch-meson qmpanel-qmpanel-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
