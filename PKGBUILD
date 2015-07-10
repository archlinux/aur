# Maintainer: toni <antoniogmc@gmail.com> 

pkgname=gqview
pkgver=2.0.4
pkgrel=5
pkgdesc="An image browser and viewer"
arch=('i686' 'x86_64')
url="http://gqview.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'desktop-file-utils')
install=gqview.install
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('7196deab04db94cec2167637cddc02f9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CPPFLAGS="-D_FILE_OFFSET_BITS=64" LDFLAGS="-lm" ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
