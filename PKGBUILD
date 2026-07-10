# Maintainer: Ezra Weaver <ezratweaver@gmail.com>
pkgname=adw-bluetooth
pkgver=1.1.2
pkgrel=1
pkgdesc='GNOME Inspired LibAdwaita Bluetooth Applet'
url="https://github.com/ezratweaver/adw-bluetooth/"
arch=('x86_64')
license=(GPL-3.0)
depends=(
  bluez
  bluez-obex
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
  go
  meson
  typescript
)

source=("https://github.com/ezratweaver/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")

b2sums=('2028bdefdf7649ce67e0a951473c0bffa0f4201351479c1332170abd7f2dbfb1f9ea4184e7afc32fe0f9df58af46932e44fb291e1fb4d4102ab7a22def16d6f6')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir "$pkgdir"
}
