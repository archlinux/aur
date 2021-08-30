# Maintainer: Your Name <youremail@domain.com>

pkgname=gnome-shell-extension-screenshotlocations
_pkgname=gnome-shell-screenshotlocations-extension
pkgver=8
pkgrel=1
pkgdesc="A GNOME extension for changing the screenshot output directory"
arch=('any')
url="https://codeberg.org/kiyui/gnome-shell-screenshotlocations-extension"
license=('GPL2')
depends=('gnome-shell')
makedepends=('meson' 'eslint')
source=(https://codeberg.org/kiyui/gnome-shell-screenshotlocations-extension/archive/8.tar.gz)
sha256sums=('0a2de2ae960712c4edbf2f303531d828be119a4b9f47ad5292c7f8e15cdeff67')

build() {
  cd "$srcdir/${_pkgname}"
  arch-meson --buildtype=plain build
  ninja -C build
}

package() {
  cd "$srcdir/${_pkgname}"
  DESTDIR="$pkgdir" ninja -C build install
}
