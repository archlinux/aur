# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=libgnt
pkgver=2.14.1
pkgrel=1
pkgdesc="GLib Ncurses Toolkit"
arch=('x86_64')
url="https://keep.imfreedom.org/libgnt/libgnt"
license=('GPL')
depends=('glib2' 'libxml2' 'ncurses')
makedepends=('meson' 'gtk-doc')
source=(https://downloads.sourceforge.net/project/pidgin/libgnt/$pkgver/$pkgname-$pkgver.tar.xz{,.asc})
sha256sums=('5ec3e68e18f956e9998d79088b299fa3bca689bcc95c86001bc5da17c1eb4bd8'
            'SKIP')
validpgpkeys=('40DE1DC7288FE3F50AB938C548F66AFFD9BDB729') # Gary Kramlich <grim@reaperworld.com>

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
