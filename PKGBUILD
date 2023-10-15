pkgname=calceph
pkgver=3.5.3
pkgrel=1
pkgdesc='The CALCEPH Library is designed to access the binary planetary ephemeris files, such INPOPxx and JPL DExxx ephemeris files'
url='https://www.imcce.fr/inpop/calceph'
license=('CeCILL-C' 'CeCILL-B' 'CeCILL')
arch=('x86_64')
depends=()
makedepends=('gcc-fortran' 'cmake')
source=("https://www.imcce.fr/content/medias/recherche/equipes/asd/calceph/calceph-${pkgver}.tar.gz")
sha256sums=('9dd2ebdec1d1f5bd6f01961d111dbf0a4b24d0c0545572f00c1d236800a25789')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --disable-shared CC=gcc FC=gfortran --prefix=/usr
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" make install 
}

