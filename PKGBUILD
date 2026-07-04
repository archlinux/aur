# Maintainer: Ezra Weaver <ezratweaver@gmail.com>
pkgname=adw-bluetooth
pkgver=1.1.1
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

b2sums=('8423139dfeea72712ae7d604249734116b0947b1b246c92cddca81517a190b75734c16c8c3a9bd88a7e7b924fa6c0e946ba233ab5e8111c228e3176bd8861255')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir "$pkgdir"
}

