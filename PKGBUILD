# Maintainer: Swapnil Devesh <me@sidevesh.com>

pkgname=luminance
_pkgname=Luminance
pkgver=1.5.0
pkgrel=2
pkgdesc="A simple GTK application to control brightness of displays including external displays supporting DDC/CI"
arch=('x86_64')
url="https://github.com/sidevesh/$_pkgname"
license=('GPL3')
makedepends=('git' 'meson' 'glib2-devel')
depends=('glib2' 'gtk4' 'libadwaita' 'ddcutil')
source=("git+https://github.com/sidevesh/$_pkgname.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
