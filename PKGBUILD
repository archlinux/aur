# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=libgnt
pkgver=2.14.3
pkgrel=1
pkgdesc="GLib Ncurses Toolkit"
arch=('x86_64')
url="https://keep.imfreedom.org/libgnt/libgnt"
license=('GPL')
depends=('glib2' 'libxml2' 'ncurses')
makedepends=('meson' 'gtk-doc')
source=(https://downloads.sourceforge.net/project/pidgin/libgnt/$pkgver/$pkgname-$pkgver.tar.xz{,.asc})
sha256sums=('57f5457f72999d0bb1a139a37f2746ec1b5a02c094f2710a339d8bcea4236123'
            'SKIP')
validpgpkeys=('40DE1DC7288FE3F50AB938C548F66AFFD9BDB729') # Gary Kramlich <grim@reaperworld.com>

build() {
  arch-meson $pkgname-$pkgver build -D python2=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
