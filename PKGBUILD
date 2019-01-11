# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=treekin
pkgver=0.5.0
pkgrel=1
pkgdesc="Efficient computation of RNA folding dynamics"
arch=('x86_64' 'i686')
license=('Custom')
url="http://www.tbi.univie.ac.at/RNA/Treekin"
depends=('blas' 'lapack' 'lapacke' 'mlapack>=0.8.1')
optdepends=('barriers: Compute generated transition rate matrices')
makedepends=('gcc-fortran')
provides=()
source=(http://www.tbi.univie.ac.at/RNA/packages/source/Treekin-${pkgver}.tar.gz)
sha256sums=('e4e707134c4396e37f11206be6ab2d79799447118702e97a02de68d1cf02e66c')

build() {
  cd "${srcdir}/Treekin-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/Treekin-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
