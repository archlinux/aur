# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=plumed
pkgver=2.2.3
pkgrel=1
pkgdesc="An open source plugin for free energy calculations in molecular systems which works together with some of the most popular molecular dynamics engines."
url="http://www.plumed-code.org/"
license=("GPL")
arch=(i686 x86_64)
depends=('atlas-lapack-base' 'zlib' 'bash' 'libmatheval')
makedepends=()
provides=('plumed')
#install=$pkgname.install
source=( https://github.com/plumed/plumed2/archive/v${pkgver}.tar.gz)
sha1sums=('8758588849611cb7e5c326dba572c84508340b33')
#options=(!buildflags)

build() {
cd ${srcdir}/${pkgname}2-${pkgver}

./configure --prefix=/usr --disable-mpi
make 
}
package() {
cd ${srcdir}/${pkgname}2-${pkgver}
make DESTDIR=${pkgdir} install
}

### Please Remember to set the following environment variable ###
# PLUMED_KERNEL=/usr/lib/libplumedKernel.so"
