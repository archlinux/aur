# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=manuals
pkgver=47.0
pkgrel=1
pkgdesc="Install, Browse, and Search developer documentation"
url="https://gitlab.gnome.org/chergert/manuals"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(flatpak gettext gom libadwaita libdex libpanel webkitgtk-6.0)
makedepends=(meson)
checkdepends=(appstream)
source=("https://gitlab.gnome.org/chergert/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('0803ff57dc70c7d8e465dae7e92ac8d0d5d21e70cf5adddfaf4ea2fdafe8aa3a')

build() {
   arch-meson $pkgname-$pkgver build
   meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"
}
