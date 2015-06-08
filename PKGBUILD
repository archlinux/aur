# Maintainer: Andrea Girotto <andrea (dot) girotto (at) gmail (dot) com>
pkgname=guile-dbd-postgresql
pkgver=2.1.4
pkgrel=2
pkgdesc='guile-dbi database driver postgresql'
arch=(i686 x86_64)
license=(GPL2)
depends=('guile-dbi>=2.1.2' postgresql-libs)
url=http://home.gna.org/guile-dbi/
source=(archlinux.patch
        http://download.gna.org/guile-dbi/${pkgname}-${pkgver}.tar.gz)
md5sums=('df216c4714ee3d7994c61e06b8767b43'
         '18a7b642570bf251ebe9255745fb5afd')

build(){
 cd ${srcdir}
 patch -p0 < archlinux.patch
 cd ${srcdir}/${pkgname}-${pkgver}
 ./configure --prefix=/usr || return 1
 make

}

package() {
 cd ${srcdir}/${pkgname}-${pkgver}
 make DESTDIR=${pkgdir} install
}
