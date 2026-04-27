# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-os-info
pkgver=0.2.0
pkgrel=1
pkgdesc="System information and diagnostics for Tuner"
arch=('any')
url="https://altlinux.space/alt-gnome/TunerOSInfo"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-gobject'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'gnome-tuner'
  'meson'
)
#checkdepends=('python-pytest')
source=("git+https://altlinux.space/alt-gnome/TunerOSInfo.git#tag=v$pkgver")
sha256sums=('919c1f299f305f382eb778078c666a4b2f89dff20abca8f3f45bddfab82069dd')

build() {
  arch-meson TunerOSInfo build
  meson compile -C build
}

#check() {
#  meson test -C build --no-rebuild --print-errorlogs
#}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
