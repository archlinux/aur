# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leopold Bloom <blinxwang@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <Jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=libticalcs
pkgver=1.1.9
pkgrel=1
pkgdesc="TI Calculator library"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL')
depends=('libticables' 'libtifiles')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.18/${pkgname}2-${pkgver}.tar.bz2")
md5sums=('862ecbd46d39b1db0fa9e0bff8930a26')

build() {
  cd "${srcdir}/${pkgname}2-${pkgver}"

  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}2-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
