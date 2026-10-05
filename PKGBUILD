# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=whisp
pkgver=1.6.0
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
sha256sums=('e358e1580fbc454a53fbee99bc8b4f2b3973b12edfc5e24e0c8ab7fa2e5dbe29')

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
