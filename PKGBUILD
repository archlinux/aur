# Maintainer:
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=g4music
pkgver=3.7.1
pkgrel=1
pkgdesc="Play your music elegantly"
arch=('aarch64' 'x86_64')
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL-3.0-only')
depends=('dconf'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'graphene'
         'gst-plugins-base-libs'
         'gstreamer'
         'gtk4'
         'hicolor-icon-theme'
         'libadwaita'
         'pango')
makedepends=('meson' 'vala')
optdepends=('gst-plugins-bad: "bad" plugin libraries'
            'gst-plugins-base: "base" plugin libraries'
            'gst-plugins-good: "good" plugin libraries'
            'gst-plugins-ugly: "ugly" plugin libraries')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('9ace75e38b21a2c6e269c0ae481eb7a1d86ea1639eb0f0dcdc4fae726efa93c19637d02d9caa7bbb87fa93dc6bdaa675e1ec3d53c6cc235a77deaa4884cc862a')

build() {
  arch-meson "${pkgname}-v${pkgver}" build
  meson compile -C build
}

# check() {
#   meson test -C build --print-errorlogs
# }

package() {
  meson install -C build --destdir "${pkgdir}"
}
