# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-panel
pkgver=0.4.7
pkgrel=2
pkgdesc="Plugin for Tuner that adds panel mode switcher to Tweaks appearance page."
arch=('x86_64')
url="https://altlinux.space/alt-gnome/tunerpanel"
license=('GPL-3.0-or-later')
depends=(
  'alt-panelmoded'
  'gnome-tuner'
  'gtk4'
  'libadwaita'
  'libpeas-2'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'vala'
)
source=("git+https://altlinux.space/alt-gnome/tunerpanel.git#tag=$pkgver")
sha256sums=('560aa02d65c0ce758825368fb0c69c835c930eec09e904b13137ee942984e976')

build() {
  arch-meson tunerpanel build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
