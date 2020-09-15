# Maintainer: Husam Bilal <husam212@gmail.com>
# Contributer: Manuel <manuel.bua@gmail.com>

pkgname=komorebi
pkgver=2.2.1
pkgrel=1
pkgdesc="A beautiful and customizable wallpaper manager for Linux "
url="https://github.com/Komorebi-Fork/komorebi"
depends=("libgee" "clutter-gtk" "clutter-gst" "webkit2gtk")
optdepends=("gst-libav: full video wallpaper support"
           "gstreamer-vaapi: hardware-accelerated video decoding through VAAPI"
           "gst-plugins-bad: hardware-accelerated video decoding through VDPAU")
makedepends=("git" "meson" "vala")
install=komorebi.install
license=("GPL3")
arch=("x86_64")
sha256sums=("4074751825cf031cca63c647372494446dab2492e8311ff439785527b3518c5b")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Komorebi-Fork/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  arch-meson build

  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" meson install -C build
}
