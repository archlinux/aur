# Contributor: ConnorBehan <connor.behan@gmail.com>
pkgname=mebitag
pkgver=0.4
pkgrel=2
pkgdesc="Apply your own tagging scheme to any media collection of your choice"
arch=(i686 x86_64)
url="http://mebitag.sourceforge.net/"
license=('LGPL')
depends=('gtk2' 'libxml2')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  sed -i -e 's/CFLAGS = -Wall -g/CFLAGS += -Wall -g/' Makefile
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
md5sums=('bea91bbb209e051162e4c24c77bf2bd5')
