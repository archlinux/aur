# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-gdm
pkgver=0.4.6
pkgrel=1
pkgdesc="Plugin for Tuner that adds GNOME Display Manager settings"
arch=('x86_64')
url="https://altlinux.space/alt-gnome/TunerGdm"
license=('GPL-3.0-or-later')
depends=(
  'gdm'
  'gnome-tuner'
  'gtk4'
  'libadwaita'
  'libpeas-2'
  'polkit'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'vala'
)
source=("git+https://altlinux.space/alt-gnome/TunerGdm.git#tag=$pkgver")
sha256sums=('e7d37c1364f3308c21c070b161b3f4f54ea644a2e35da8f695f34adaa7f96736')

build() {
  arch-meson TunerGdm build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
