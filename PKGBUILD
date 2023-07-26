# Maintainer: knedl1k <knedl1k at duck dot com>
# Contributor: eolianoe <eolianoe At gmail DoT com>

pkgname=f90cache
pkgver=0.99c
pkgrel=1
pkgdesc="Caching pre-processor for Fortran compilers"
arch=('i686' 'x86_64')
url="https://perso.univ-rennes1.fr/edouard.canot//f90cache/"
license=('GPL')
depends=('glibc')
source=("${url}${pkgname}-${pkgver}.tar.gz")
sha256sums=('13f8297ecba73671d43376b71ef0e453bd9d6677a901d1c95f01f16cc33776e1')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make install DESTDIR=${pkgdir}
}
