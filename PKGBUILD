# Maintainer: Bink
pkgname=memerist
pkgver=0.6.0
pkgrel=2
pkgdesc="A modern meme editor built with GTK 4 and Libadwaita"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/memerist"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'glib2'
  'libpng'
  'libjpeg'
)
makedepends=(
  'meson'
  'ninja'
  'gcc'
  'pkg-config'
  'blueprint-compiler'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('29fc48a83c153dee3255bebf87225ccc3330166739677d5988a9e0d31b60a7de')
b2sums=('86c8d41e26e7f2921eb4a1f6e21bc435acd1611436ec3c76a1b19cc06215cc12e22fb72f6e72d40e17e0df17b02be639b4482053340be802943e50aa8622d3f7')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir="${pkgdir}"
}
