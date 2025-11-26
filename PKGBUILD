# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-panel
pkgver=0.4.2
pkgrel=1
pkgdesc="Plugin for Tuner that adds panel mode switcher to Tweaks appearance page."
arch=('x86_64')
url="https://altlinux.space/alt-gnome/tunerpanel"
license=('GPL-3.0-or-later')
depends=(
  'alt-panelmoded'
  'libadwaita'
  'libpeas-2'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'gnome-tuner'
  'meson'
  'vala'
)
source=("git+https://altlinux.space/alt-gnome/tunerpanel.git#tag=$pkgver")
sha256sums=('0ed777e2583163985b58931ac8b2cfe6e35e3653e7b51177505f9191c729a361')

build() {
  arch-meson tunerpanel build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
