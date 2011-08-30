# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=cogl
pkgver=1.7.6
pkgrel=1
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('libdrm' 'libxext' 'libxdamage' 'libxcomposite' 'gdk-pixbuf2' 'pango')
makedepends=('mesa' 'gobject-introspection')
options=(!libtool)
source=(http://download.gnome.org/sources/$pkgname/1.7/$pkgname-$pkgver.tar.xz)
sha256sums=('4dd97260ecf464753f9daa30e10ee9d160b323515811b73bef8d84d3274ae072')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
