# Maintainer: j_klee <jannes.klee@gmail.com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: aphirst <adam@aphirst.karoo.co.uk>

pkgname=fgsl-git
pkgver=1.5
pkgrel=1
pkgdesc="A Fortran interface to the GNU Scientific Library"
arch=('i686' 'x86_64')
url="https://github.com/reinh-bader/fgsl/"
license=('GPL')
depends=("gsl>=2.6" 'gcc-fortran' 'automake' 'autoconf' 'libtool')
# to the main repository
source=("${pkgname}::git+https://github.com/reinh-bader/fgsl.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}"
}
