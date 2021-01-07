# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

pkgname=libg15render
pkgver=1.2
pkgrel=5
pkgdesc="A small graphics library optimised for drawing on an LCD"
arch=('x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('libg15')
source=(https://downloads.sourceforge.net/g15tools/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('960fd6bc6159b1b12e1de3b0c07e5960d7d5056d4927be8eddf89a911e2c97a8677ef41456aa255399e8a86cd354b848fab28a47005ee2d1b6640e0c886deaac')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
