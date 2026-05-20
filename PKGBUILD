# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=cassette
pkgver=0.2.2
pkgrel=1
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 i686 x86_64)
url="https://altlinux.space/rirusha/${pkgname^}"
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
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/sources.tar.gz")
sha512sums=('958ab86fcdc46d385835b1098c26dc7b3499f0cb50470ca557ad9a7221d6113d6305232462ad36bb72f9d027df17869ad1fab8a68f172d5ded0c795fdde47ccd')

build() {
  arch-meson build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
