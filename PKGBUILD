# Maintainer: Ezra Weaver <ezratweaver@gmail.com>
pkgname=adw-bluetooth
pkgver=0.2.0
pkgrel=1
pkgdesc='GNOME Inspired LibAdwaita Bluetooth Applet'
url="https://github.com/ezratweaver/adw-bluetooth/"
arch=(any)
license=(GPL-3.0)
depends=(
  dconf
  gjs
  glib2
  gtk4
  hicolor-icon-theme
  libadwaita
)
makedepends=(
  blueprint-compiler
  git
  meson
  typescript
)

source=("https://github.com/ezratweaver/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")

b2sums=('695de112d302455deb0112019358f395c20be862f7ca3c4c0a98d76cce3a3af90553053a843c31930b116cd48b1e277e0eeb2ab6a7381b512f25dae7aa91d336')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir "$pkgdir"
}
