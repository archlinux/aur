# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=treekin
pkgver=0.3.1
pkgrel=1
pkgdesc="Efficient computation of RNA folding dynamics"
arch=('x86_64' 'i686')
license=('Custom')
url="http://www.tbi.univie.ac.at/RNA/Treekin"
depends=('blas' 'lapack')
optdepends=('barriers: Compute generated transition rate matrices')
makedepends=()
provides=()
source=(http://www.tbi.univie.ac.at/RNA/Treekin/Treekin-${pkgver}.tar.gz)
md5sums=('54d59ba74c9b56014f4ca93ef6c178c2')

build() {
  cd "${srcdir}/Treekin-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/Treekin-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}

