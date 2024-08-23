# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gapless
_name=g4music
pkgver=3.8.2
pkgrel=1
pkgdesc="Play your music elegantly (AKA: G4Music)"
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
provides=("${_name}")
conflicts=("${_name}")
source=("${url}/-/archive/v${pkgver}/${_name}-v${pkgver}.tar.gz")
b2sums=('7ac7039d42e81745bef5075b6895132ee3172fbb7c4907b90d61efd37fe136d1e3c0a8e9ae00fd384543645e230f62c2a2ddc62e612766289369eaae7993a814')

build() {
  arch-meson "${_name}-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
