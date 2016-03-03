# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: aphirst <adam@aphirst.karoo.co.uk>

pkgname=fgsl
pkgver=1.1.0
pkgrel=1
pkgdesc="A Fortran interface to the GNU Scientific Library"
arch=('i686' 'x86_64')
url="http://www.lrz.de/services/software/mathematik/gsl/fortran/"
license=('GPL')
depends=("gsl>=2.1" 'gcc-fortran')
source=("${url}download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('18d45e2bf87695587cd83320777ada0d9e2dfdee43eb9d76e0dab660758aff47')

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
