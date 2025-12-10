# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-panel
pkgver=0.4.3
pkgrel=1
pkgdesc="Plugin for Tuner that adds panel mode switcher to Tweaks appearance page."
arch=('x86_64')
url="https://altlinux.space/alt-gnome/tunerpanel"
license=('GPL-3.0-or-later')
depends=(
  'alt-panelmoded'
  'gtk4'
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
sha256sums=('0b987c54b88a9578c1f1f1bbf468e866dc274d80eb02f672bfe7a16d1307ce28')

build() {
  arch-meson tunerpanel build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
