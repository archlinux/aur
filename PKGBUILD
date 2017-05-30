# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Simo Leone <simo@archlinux.org>

pkgname=libticonv
pkgver=1.1.5
pkgrel=1
pkgdesc="TI character set conversion library"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL2')
depends=('glib2')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.18/${pkgname}-${pkgver}.tar.bz2")
md5sums=('7532b3a075c49751b0248630550e2a98')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf -fi
  ./configure --prefix=/usr --enable-iconv
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
