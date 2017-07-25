# Original packager: tantalum <tantalum at online dot de>
# Package by Andrea Girotto <andrea (dot) girotto (at) gmail (dot) com>
pkgname=guile-www
pkgver=2.40
pkgrel=1
pkgdesc='A set of Guile Scheme modules to facilitate HTTP, URL and CGI programming'
arch=(any)
license=(GPL3)
depends=(guile)
url=http://www.nongnu.org/guile-www/
source=(http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.lz)
md5sums=('1c2e045af35052be4be321e33caf9c35')

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
