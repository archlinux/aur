# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from DeepSeek V4 Flash.

pkgname=whisp
pkgver=1.4.0
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
sha256sums=('e3a809ac35fd739a99dd6441842b5dad4ba4ec996b29386261b3a4e33d5f3b32')

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
