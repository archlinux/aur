# Maintainer: dyslechtchitect <ron.neuman@gmail.com>
pkgname=tfcbm
pkgver=1.1.2
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
sha256sums=('93edf8172ce4d05533ea1ddc4dfd74a06fde8b6e0f5149f9ca49815f8b84ef01')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup builddir --prefix=/usr
  meson compile -C builddir
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C builddir --destdir="${pkgdir}"
}
