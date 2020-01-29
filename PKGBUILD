# Maintainer: Mircea Mihalea <mircea at mihalea dot ro>
# Contributor: David Brazdil <db538@cam.ac.uk>

pkgname=tvolnoti
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight volume notification"
url="https://www.github.com/mihalea/tvolnoti"
arch=('x86_64' 'i686')
license=('GPL')
depends=('dbus' 'dbus-glib' 'gtk2' 'gdk-pixbuf2')
makedepends=('gcc' 'make' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz")
md5sums=('c848fce75298339d03c96a76e5445dec')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
