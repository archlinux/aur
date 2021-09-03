# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-screenshotlocations
_pkgname=gnome-shell-screenshotlocations-extension
pkgver=8
pkgrel=2
pkgdesc="A GNOME extension for changing the screenshot output directory"
arch=('any')
url="https://codeberg.org/kiyui/gnome-shell-screenshotlocations-extension"
license=('GPL2')
depends=('gnome-shell')
makedepends=('meson')
source=(https://codeberg.org/kiyui/gnome-shell-screenshotlocations-extension/archive/8.tar.gz)
sha256sums=('0a2de2ae960712c4edbf2f303531d828be119a4b9f47ad5292c7f8e15cdeff67')

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
