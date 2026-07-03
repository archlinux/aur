# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-glts
pkgver=0.1.1
pkgrel=2
pkgdesc="Plugin for Tuner that adds GNOME Legacy Theme Switcher config settings"
arch=('x86_64')
url="https://altlinux.space/alt-gnome/TunerGLTS"
license=('GPL-3.0-or-later')
depends=(
  'gnome-tuner'
  'libpeas-2'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'vala'
)
source=("git+https://altlinux.space/alt-gnome/TunerGLTS.git#tag=v$pkgver")
sha256sums=('8e9db708c0f63f360abbd5c2e97eb26797e0c846bfb72b3af0427a278c0c7321')

build() {
  arch-meson TunerGLTS build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
