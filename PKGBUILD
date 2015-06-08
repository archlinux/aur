# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: aphirst <adam@aphirst.karoo.co.uk>

pkgname=fgsl
pkgver=1.0.0
pkgrel=1
pkgdesc="A Fortran interface to the GNU Scientific Library"
arch=('i686' 'x86_64')
url="http://www.lrz.de/services/software/mathematik/gsl/fortran/"
license=('GPL')
depends=('gsl' 'gcc-fortran')
source=("${url}${pkgname}-${pkgver}.tar.gz")
sha256sums=('2841f6deb2ce05e153fc1d89fe5e46aba74c60a2595c857cef9ca771a0cf6290')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make -j1
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
