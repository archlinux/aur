# Maintainer: knedl1k <knedl1k at duck dot com>
# Contributor: eolianoe <eolianoe At gmail DoT com>

pkgname=f90cache
pkgver=0.99h
pkgrel=1
pkgdesc="Caching pre-processor for Fortran compilers"
arch=('i686' 'x86_64')
url="https://perso.univ-rennes1.fr/edouard.canot//f90cache/"
license=('GPL')
depends=('glibc')
source=("${url}${pkgname}-${pkgver}.tar.gz")
sha256sums=('5da807fc6a3b9a402854911921948afb3213ce720425be61119ef6757de1e19c')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make install DESTDIR=${pkgdir}
}
