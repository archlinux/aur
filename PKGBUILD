# Maintainer: Ezra Weaver <ezratweaver@gmail.com>
pkgname=adw-bluetooth
pkgver=0.3.0
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

b2sums=('54e4805c84f6efbaccef293ccf76e36a4500236776c53831a401288e8460e37dd43b0f003d630e10cd37e4a744db18937e2814f60b0f3b7a78760b28079fb242')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir "$pkgdir"
}
