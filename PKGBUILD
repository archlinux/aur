# Maintainer: John Lindgren <john@jlindgren.net>

pkgname=qmpanel
pkgver=0.3
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
sha256sums=("14883ffa21fab0e76a7c7ae3c9416b8e999d4becc7ee12f10ecc5a8fcc60f7c4")

build() {
  arch-meson qmpanel-qmpanel-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
