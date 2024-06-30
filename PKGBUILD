# Maintainer:
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=g4music
pkgver=3.7.2
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
b2sums=('931423eff48169aef1ae2db80ade206f4ac0206411c8b7f5013fcd013557f033a5a74f68a378122f1da9395efa1bc1e73e80cfdf4155edfb1314a299a4501930')

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
