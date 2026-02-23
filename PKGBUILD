# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-os-info
pkgver=0.1.1
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
source=("git+https://altlinux.space/alt-gnome/TunerOSInfo.git#tag=v$pkgver")
sha256sums=('3cda4db2632f36e4dffeb951517a4e0eab77abd0f6a14e6023fdf65b63246e4e')

build() {
  arch-meson TunerOSInfo build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
