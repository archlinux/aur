# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=gtkmdview
pkgver=0.4.3
pkgrel=1
pkgdesc='A simple library that renders markdown as a GtkWidget for viewing.'
arch=('x86_64')
url='https://github.com/johan-bjareholt/gtkmdview/'
license=('GPL3')
depends=('md4c' 'gtk4')
makedepends=('meson')
source=("https://github.com/johan-bjareholt/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4a2e16d064bd6f843ba834e843a365aad790b9861eabb8eb9b0cde95b4b514ac')
conflicts=("${pkgname}-git")

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
