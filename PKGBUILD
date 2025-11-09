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

b2sums=('86a737fd22e4fabca435f2419e5d729dbf8c953099e1907941aafa3b74e3df07d97ca67639fc06193d846f163fb0309a2f67ad94763a7c4e66b87ba63c917827')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir "$pkgdir"
}
