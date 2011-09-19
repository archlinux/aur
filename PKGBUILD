# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=cogl
pkgver=1.8.0
pkgrel=1
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('libdrm' 'libxext' 'libxdamage' 'libxcomposite' 'gdk-pixbuf2' 'pango')
makedepends=('mesa' 'gobject-introspection')
options=(!libtool)
source=(http://download.gnome.org/sources/$pkgname/1.8/$pkgname-$pkgver.tar.xz)
sha256sums=('b1551c129d5570b63e7130971622fc2ab8d4ecbf0dc1773df1c54fa9c1cb0a2c')

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
