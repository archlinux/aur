# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gapless
_name=g4music
pkgver=3.9
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
b2sums=('93b223ebe520b57b7f382e9c43b07ade34635d80f75fbc11453ba1cdcaabe3b814f9e460334e2755e4c1b5ce688cfdfa0b3918950536ea067dbd88d76534ca1e')

build() {
  arch-meson "${_name}-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
