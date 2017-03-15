# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=golem95
pkgver=1.3.3
pkgrel=1
pkgdesc="A package for the numerical evaluation of integrals and tensor form factors entering the calculation of one-loop amplitudes with up to six external legs, written in Fortran 95."
url="https://golem.hepforge.org/"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=(
    'gcc-fortran'
)
source=("http://www.hepforge.org/archive/golem/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0f4f5ac3e33368e127dcaec23cc14b25e7cba614c614a5a871c60700d36b4fbd')

prepare() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
}

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}

# Local Variables:
# mode: sh
# End:
