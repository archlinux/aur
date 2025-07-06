# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-gdm
pkgver=0.4.0
pkgrel=1
pkgdesc="Plugin for Tuner that adds GNOME Display Manager settings"
arch=('x86_64')
url="https://altlinux.space/alt-gnome/TunerGdm"
license=('GPL-3.0-or-later')
depends=(
  'gdm'
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
sha256sums=('e189df467704d9c8008fa5ee78813d68a52b04b00d25433b9ddff9fd5572e496')

build() {
  arch-meson TunerGdm build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
