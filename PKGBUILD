# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=libgnt
pkgver=2.14.2
pkgrel=1
pkgdesc="GLib Ncurses Toolkit"
arch=('x86_64')
url="https://keep.imfreedom.org/libgnt/libgnt"
license=('GPL')
depends=('glib2' 'libxml2' 'ncurses')
makedepends=('meson' 'gtk-doc')
source=(https://downloads.sourceforge.net/project/pidgin/libgnt/$pkgver/$pkgname-$pkgver.tar.xz{,.asc})
sha256sums=('61cf74b14eef10868b2d892e975aa78614f094c8f4d30dfd1aaedf52e6120e75'
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
