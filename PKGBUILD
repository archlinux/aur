# Maintainer: kancko <kancko>

pkgname=gnome-rounded-blur
pkgver=1.0.2
pkgrel=1
pkgdesc="GNOME Shell BlurEffect with rounded corners"
arch=('x86_64')
url="https://github.com/kancko/gnome-rounded-blur"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'glibc'
  'graphene'
  'libgcc'
  'mutter'
)
makedepends=(
  'git'
  'meson'
  'glib2-devel'
  'gobject-introspection'
)
source=("git+https://github.com/kancko/${pkgname}.git#tag=v${pkgver}")
sha256sums=('e2406139c5cbf2f0f86d393c51b410fefbbdc6ce31e0317d40f09baacce75647')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
