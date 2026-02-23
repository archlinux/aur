# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-glts
pkgver=0.1.0
pkgrel=1
pkgdesc="Plugin for Tuner that adds GNOME Legacy Theme Switcher config settings"
arch=('x86_64')
url="https://altlinux.space/alt-gnome/TunerGLTS"
license=('GPL-3.0-or-later')
depends=(
  'libpeas-2'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'gnome-tuner'
  'meson'
  'vala'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+https://altlinux.space/alt-gnome/TunerGLTS.git#tag=v$pkgver")
sha256sums=('38699b239f90e18f349673387c9c36a3f15d81ed60be88ad53f4af504c895909')

build() {
  arch-meson TunerGLTS build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
