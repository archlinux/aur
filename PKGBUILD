# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-gdm
pkgver=0.4.1
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
sha256sums=('f2eef95822b902b110984a0df6b1f9669f87081cc1de2350b610fde58a4ff67e')

build() {
  arch-meson TunerGdm build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
