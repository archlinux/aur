# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=plumed
pkgver=2.5.0
pkgrel=1
pkgdesc="An open source plugin for free energy calculations in molecular systems which works together with some of the most popular molecular dynamics engines."
url="http://www.plumed-code.org/"
license=("GPL")
arch=(i686 x86_64)
depends=('lapack' 'zlib' 'gsl')
makedepends=()
provides=('plumed')
#install=$pkgname.install
source=( https://github.com/plumed/plumed2/releases/download/v${pkgver}/plumed-${pkgver}.tgz)
sha1sums=('0b93fcd39a4e5b1b81e24657438e3831faa53753')
#options=(!buildflags)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-mpi
  make
}


package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

### Please Remember to set the following environment variable ###
# PLUMED_KERNEL=/usr/lib/libplumedKernel.so"
