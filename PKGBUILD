# Maintainer: kancko <kancko>

pkgname=gnome-rounded-blur
pkgver=1.0.0
pkgrel=1
pkgdesc="GNOME Shell BlurEffect with rounded corners"
arch=('x86_64')
url="https://github.com/aunetx/blur-my-shell"
license=('GPL-3.0')
makedepends=(
  'git'
  'meson'
  'mutter'
  'glib2-devel'
  'gobject-introspection'
)
source=("git+https://github.com/kancko/${pkgname}.git#tag=v${pkgver}")
sha256sums=('04631f8cc805f07f86b5f9b892d9105fae992dd54f8515f98981dd51adff84bf')

prepare() {
  cd $pkgname
  meson setup build
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
