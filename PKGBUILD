# Maintainer: Andrea Girotto <andrea (dot) girotto (at) gmail (dot) com>
# Original packager: tantalum <tantalum at online dot de>
pkgname=guile-www
pkgver=2.41
pkgrel=1
pkgdesc='A set of Guile Scheme modules to facilitate HTTP, URL and CGI programming'
arch=(any)
license=(GPL3)
depends=(guile)
url=http://www.nongnu.org/guile-www/
source=(http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.lz)
md5sums=('b856f3897570cc5bf8c46f14f7089542')

build(){
   cd ${srcdir}/${pkgname}-${pkgver}

   ./configure --prefix=/usr || return 1
   make

   #remove documentation
   #rm ${datadir}/info -r
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


#check() {
#   cd ${srcdir}/${pkgname}-${pkgver}
#   make check
#}
