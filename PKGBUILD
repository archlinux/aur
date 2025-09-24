# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=cassette
pkgver=0.2.1.g49
pkgrel=1
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 i686 x86_64)
url="https://gitlab.gnome.org/Rirusha/${pkgname^}"
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glibc
  glib2
  gst-plugins-good
  gstreamer
  gtk4
  json-glib
  hicolor-icon-theme
  libadwaita
  libsoup3
  libgee
  libxml2
  libxml2-legacy
  sqlite
  webkitgtk-6.0
  xdg-desktop-portal-impl
)
makedepends=(
  blueprint-compiler
  meson
  vala
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/${pkgname^}-v$pkgver.tar.gz")
sha512sums=('7e61a736402a878634678a09d2fb9d9da93a14241df626eb67f86cf95756311dc4005a1d7c6bd217aac682b98e471aa15f72f8860d2f8eca0f9c92887d716692')

build() {
  arch-meson ${pkgname^}-v$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
