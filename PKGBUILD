# Maintainer: eolianoe <eolianoe At gmail DoT com>
pkgname=f90cache
pkgver=0.99
pkgrel=1
pkgdesc="Caching pre-processor for Fortran compilers"
arch=('i686' 'x86_64')
url="http://people.irisa.fr/Edouard.Canot/f90cache/"
license=('GPL')
depends=('glibc')
source=("${url}${pkgname}-${pkgver}.tar.bz2")
sha256sums=('be3fe77b676bc784dd45b3f65b4a5db34d858ed29156b29d8da38b24585bda7d')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make install DESTDIR=${pkgdir}
}
