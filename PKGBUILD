# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=treekin
pkgver=0.4
pkgrel=1
pkgdesc="Efficient computation of RNA folding dynamics"
arch=('x86_64' 'i686')
license=('Custom')
url="http://www.tbi.univie.ac.at/RNA/Treekin"
depends=('blas' 'lapack')
optdepends=('barriers: Compute generated transition rate matrices')
makedepends=()
provides=()
source=(http://www.tbi.univie.ac.at/RNA/packages/source/Treekin-${pkgver}.tar.gz)
sha256sums=('2c19e08c8aa2089d1be6141119a4d8d1d62f7375c4341d2c8fe29ec3d51cc159')

build() {
  cd "${srcdir}/Treekin-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/Treekin-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}

