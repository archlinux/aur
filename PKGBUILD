# Maintainer: John Lindgren <john@jlindgren.net>

pkgname=qmpanel
pkgver=0.2
pkgrel=1
pkgdesc="A Minimal Qt-Based Desktop Panel"
arch=("x86_64")
url="https://github.com/jlindgren90/qmpanel"
license=("LGPL2.1")
makedepends=("meson")
depends=(
  "glib2"
  "kwindowsystem5"
  "libxcb"
  "libxcomposite"
  "libxdamage"
  "libxrender"
)

source=("https://github.com/jlindgren90/qmpanel/archive/qmpanel-$pkgver.tar.gz")
sha256sums=("a2e0ee55225124d1444b592f3ccb411c010ef84c5da6b91d4a3463e8da02427a")

build() {
  arch-meson qmpanel-qmpanel-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
