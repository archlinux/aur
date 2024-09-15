# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gapless
_name=g4music
pkgver=3.9.2
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
b2sums=('1126f23268e4cbf2f942f8c16ff6a0544ad295f6096d738bdc2bea1cabdffcfa035efe00937ae6af3ee10cf0043e9f9fd01fb9b531884aa4d0272c252612de37')

build() {
  arch-meson "${_name}-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
