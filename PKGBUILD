# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-gdm
pkgver=0.4.4
pkgrel=1
pkgdesc="Plugin for Tuner that adds GNOME Display Manager settings"
arch=('x86_64')
url="https://altlinux.space/alt-gnome/TunerGdm"
license=('GPL-3.0-or-later')
depends=(
  'gdm'
  'gtk4'
  'libadwaita'
  'libpeas-2'
  'polkit'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'gnome-tuner'
  'meson'
  'vala'
)
source=("git+https://altlinux.space/alt-gnome/TunerGdm.git#tag=$pkgver")
sha256sums=('5c58344d350e05cecce20bf54bbb0ad5b8b9011da4105448b153ced9af9c84a6')

build() {
  arch-meson TunerGdm build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
