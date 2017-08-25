# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: aphirst <adam@aphirst.karoo.co.uk>

pkgname=fgsl
pkgver=1.2.0
pkgrel=1
pkgdesc="A Fortran interface to the GNU Scientific Library"
arch=('i686' 'x86_64')
url="https://www.lrz.de/services/software/mathematik/gsl/fortran/"
license=('GPL')
depends=("gsl>=2.1" 'gcc-fortran')
source=("${url}download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('00fd467af2bb778e8d15ac8c27ddc7b9024bb8fa2f950a868d9d24b6086e5ca7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
