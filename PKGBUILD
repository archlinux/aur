# Maintainer: Bink
pkgname=memerist
pkgver=0.6.2
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
  'blueprint-compiler'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c2420667cbe290ed7c2c2a59984619f5644ec1608b4d8b1594048f0c5ce161d6')
b2sums=('933b67cf21a8726c9ae1f2086b7b2525c013cecd7a6d6d8e3b8b7682cbee57743b3eafa588c4dba50c4e62144fb7e1d2e7b0014a83e30af8c4ea79005d2be5c0')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir="${pkgdir}"
}
