# Maintainer: Andrea Girotto <andrea (dot) girotto (at) gmail (dot) com>
pkgname=guile-dbd-postgresql
pkgver=2.1.9
pkgrel=0
pkgdesc='guile-dbi database driver postgresql'
arch=(i686 x86_64)
license=(GPL2)
depends=('guile-dbi>=2.1.2' postgresql-libs)
url=https://github.com/eestrada/guile-dbi/tree/master/guile-dbd-postgresql
source=(https://github.com/opencog/guile-dbi/archive/refs/tags/guile-dbi-${pkgver}.tar.gz)
md5sums=('6a9a37cf0836cbddf30dc7e1d945f6da')

build(){
 cd ${srcdir}
 cd ${srcdir}/guile-dbi-guile-dbi-${pkgver}/${pkgname}
 ./autogen.sh --prefix=/usr || return 1
 make
}

package() {
 cd ${srcdir}/guile-dbi-guile-dbi-${pkgver}/${pkgname}
 make DESTDIR=${pkgdir} install
}
