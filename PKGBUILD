# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=cogl
pkgver=1.7.8
pkgrel=1
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('libdrm' 'libxext' 'libxdamage' 'libxcomposite' 'gdk-pixbuf2' 'pango')
makedepends=('mesa' 'gobject-introspection')
options=(!libtool)
source=(http://download.gnome.org/sources/$pkgname/1.7/$pkgname-$pkgver.tar.xz)
sha256sums=('afa114951946c5aafde965b6c34eef487731de06e002474d7956faa8e5754749')

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
