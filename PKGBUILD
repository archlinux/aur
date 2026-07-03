# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-tweaks
pkgver=0.5.3
pkgrel=2
pkgdesc="Plugin for Tuner that adds more ways to customize GNOME."
arch=('x86_64')
url="https://altlinux.space/alt-gnome/tunertweaks"
license=('GPL-3.0-or-later')
depends=(
  'gnome-tuner'
  'gtk4'
  'libadwaita'
  'libgee'
  'libpeas-2'
  'gnome-desktop-4'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'vala'
)
source=("git+https://altlinux.space/alt-gnome/tunertweaks.git#tag=$pkgver")
sha256sums=('28b467d43ca8abd6d14e76259f49ccd548577054ff52ba0fef7bb3775575abe7')

build() {
  arch-meson tunertweaks build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
