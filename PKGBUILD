# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gapless
_name=g4music
pkgver=4.2
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
b2sums=('875a58b278398be1999865b18cb3aa91d69e7c05a43167715af022d55f0bae06e3fe5f6c2af5ac6d9545a0e819e82bcf5547e1945578722bed29509def73b6c5')

build() {
  arch-meson "${_name}-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
