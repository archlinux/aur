# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-tweaks
pkgver=0.5.5
pkgrel=1
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
sha256sums=('7fe2a339f5971f96b7086dacdc40701bb7fa6ce513268aefe25f456fc22cce2f')

build() {
  arch-meson tunertweaks build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
