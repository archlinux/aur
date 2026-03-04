# Maintainer: Bink
pkgname=memerist
pkgver=0.4.2
pkgrel=1
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
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vani-tty1/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('19221b98aa40f65c4f9b285f76d9f00b7fbb663961026223fe9377c85afec1a2')
b2sums=('19aa3a031f80589412b34eb4c8151b0380e1f9c0ba23b9b99de80c2f35784d5e2e3da701c5d05fe1e514093e4a3a04476de2944b40d343169455a5e4a4dd2774')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir="${pkgdir}"
}
