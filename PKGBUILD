# Maintainer: Your Name <youremail@domain.com>
pkgname=gnome-loop
_pkgname=loop
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple audio loop machind for GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/danigm/loop"
license=('GPL3')
depends=(gtk4 libadwaita)
makedepends=(meson python)
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar)
sha512sums=('cdb7853f815c633dcef8b42ce9218798972a12434c5d81e169977b87b96d64797702e41b3fbf5b433869c8862e3ac75d236c65c83c9a156d54dfebcbaf732c50')

build() {
  arch-meson "$_pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
