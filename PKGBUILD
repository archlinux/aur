# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

pkgname=libg15
pkgver=1.2.7
pkgrel=4
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers"
arch=('x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('libusb-compat')
source=(https://downloads.sourceforge.net/g15tools/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('ddffb38f5c3d9ce0cb90b0375c2f5d317a7bb3889fe59d56932a0889c6e15bc2f1e590757d3182eddf7c5bd3101303b332b18fbd37247c20f66e1be256aa93c0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
