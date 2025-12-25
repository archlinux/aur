# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-panel
pkgver=0.4.4
pkgrel=2
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
sha256sums=('fc1922360311e431b2586c941f92e5eb599e48408999c9a93c71a3f80159e5d6')

build() {
  arch-meson tunerpanel build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
