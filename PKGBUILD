# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-gdm
pkgver=0.4.7
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
sha256sums=('3a7a4120dc4fac82f429d19d69392b7a4e543a88b3e79c1b2387b38873340a3d')

build() {
  arch-meson TunerGdm build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
