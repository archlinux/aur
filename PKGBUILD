# Maintainer: eolianoe <eolianoe At gmail DoT com>
pkgname=f90cache
pkgver=0.96
pkgrel=1
pkgdesc="Caching pre-processor for Fortran compilers"
arch=('i686' 'x86_64')
url="http://people.irisa.fr/Edouard.Canot/f90cache/"
license=('GPL')
depends=('glibc')
source=("${url}${pkgname}-${pkgver}.tar.bz2")
sha256sums=('b3cbf70ae0e9b11f632454b223243c0e0d32c29a22b002e20c3b42f4160e5f25')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make install DESTDIR=${pkgdir}
}
