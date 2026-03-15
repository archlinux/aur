# Maintainer: Bink
pkgname=memerist
pkgver=0.5.0
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
sha256sums=('841deec6f84a8b27eb342fd3c459ccf17c21b7d3ffede3c21c88ac1bc0459cf6')
b2sums=('2a3c5522382bd93a9068684fc3e49180e19b2c4ae802c85eba415a6d2e66baa4e34877d57a68a131f5976abbb0b14f547b71af7c6e906bcd2f73a9153d9c8a11')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir="${pkgdir}"
}
