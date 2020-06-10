# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=libgnt
pkgver=2.14.0
pkgrel=1
pkgdesc="GLib Ncurses Toolkit"
arch=('x86_64')
url="https://bitbucket.org/pidgin/libgnt/"
license=('GPL')
depends=('glib2' 'libxml2' 'ncurses')
makedepends=('meson' 'gtk-doc')
source=(https://downloads.sourceforge.net/project/pidgin/libgnt/$pkgver/$pkgname-$pkgver.tar.xz{,.asc})
sha256sums=('6b7ea2030c9755ad9756ab4b1d3396dccaef4a712eccce34d3990042bb4b3abf'
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
