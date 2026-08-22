# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from DeepSeek V4 Flash.

pkgname=whisp
pkgver=1.4.1
pkgrel=1
pkgdesc="Anti-Note for GNOME — a fluid, gesture-driven scratchpad with WYSIWYG Markdown"
arch=('any')
url="https://github.com/tanaybhomia/Whisp"
license=('GPL-3.0-only')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
)
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tanaybhomia/Whisp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f106654900ce9f5aef9a8cb8bd48424f35d93f27a17e9c8526702473c449ea2')

build() {
  cd "${srcdir}/Whisp-${pkgver}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${srcdir}/Whisp-${pkgver}"
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
