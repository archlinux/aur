# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gapless
_name=g4music
pkgver=4.3
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
b2sums=('adc8bd82136bef283ca0247f48932bbc63ba314ae50c18be0761c0be0f53f766f7b7cda709e36d8de0169ef12ca3dad0405039732fe6c90ae6c866b0bb8d3ac1')

build() {
  arch-meson "${_name}-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
