# Contributor: Axel Reidemeister[computerkranker] <mail@axelreidemeister.de>
# Maintainer: Alexandre Magno <alexandre.mbm@gmail.com>

pkgname=inkblot
pkgver=0.99.9
pkgrel=2
_maintainer=alexandre-mbm
pkgdesc="Inkblot reports on the remaining ink levels in a wide variety of USB and Parallel connected printers."
arch=('i686' 'x86_64')
url="https://github.com/${_maintainer}/${pkgname}"
license=('GPL')
depends=('libinklevel' 'libieee1284')
makedepends=('libinklevel' 'libieee1284')
source=("https://github.com/${_maintainer}/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('eadeafc4a5621d684287fa1ac6aa65d3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc LIBS=-lX11
  make || return 1
  make DESTDIR="${pkgdir}/" install
}
