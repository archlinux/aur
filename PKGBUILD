# Maintainer: dyslechtchitect <ron.neuman@gmail.com>
pkgname=tfcbm
pkgver=1.1.5
pkgrel=1
pkgdesc="The Friendly Clipboard Manager - Track and manage your clipboard history"
arch=('any')
url="https://github.com/dyslechtchitect/tfcbm"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'gdk-pixbuf2'
  'meson'
  'xdotool'
)
optdepends=(
  'libadwaita: adaptive GNOME styling'
  'webkit2gtk-6.0: HTML preview in clipboard items'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dyslechtchitect/tfcbm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e22c3d7d68dce4aa9bf0b28730f760eb9a941b8803066ffe0e0f2779f2b9d6f8')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup builddir --prefix=/usr
  meson compile -C builddir
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C builddir --destdir="${pkgdir}"
}
