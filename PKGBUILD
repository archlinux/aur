#Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=libdap
pkgver=3.18.1
pkgrel=2
pkgdesc="A library which contains an implementation of DAP 2.0 and 3.1"
arch=('i686' 'x86_64')
url="https://www.opendap.org/index.php/software/libdap"
license=('LGPL2.1')
depends=('curl' 'libxml2' 'util-linux')
source=(http://www.opendap.org/pub/source/${pkgname}-${pkgver}.tar.gz)
md5sums=('9bdca37f89dca3e1df2239ceb32f74a8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr 
  make
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
