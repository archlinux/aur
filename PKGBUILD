# Maintainer: kancko <kancko>

pkgname=gnome-rounded-blur
pkgver=1.0.1
pkgrel=1
pkgdesc="GNOME Shell BlurEffect with rounded corners"
arch=('x86_64')
url="https://github.com/kancko/gnome-rounded-blur"
license=('GPL-3.0')
makedepends=(
  'git'
  'meson'
  'mutter'
  'glib2-devel'
  'gobject-introspection'
)
source=("git+https://github.com/kancko/${pkgname}.git#tag=v${pkgver}")
sha256sums=('6d8b80659426d7cfbd8b9a23553fa139ba8ee1b94481bbdd457de9b1b70d7067')

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
