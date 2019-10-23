# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=barriers
pkgver=1.8.0
pkgrel=1
pkgdesc="Compute local minima and energy barriers of a landscape"
arch=('x86_64' 'i686')
license=('Custom')
url="https://www.tbi.univie.ac.at/RNA/Barriers"
depends=()
optdepends=('viennarna: Generate sets of suboptimal RNA secondary structures with RNAsubopt'
            'treekin: Compute folding dynamics using barriers generated transition rates')
makedepends=()
provides=()
source=(http://www.tbi.univie.ac.at/RNA/packages/source/Barriers-${pkgver}.tar.gz)
sha256sums=('c1b16f5ac32def877677a5d8afa08d7fd16d3c4d4d1a2e683a5da09e4071feaa')

build() {
  cd "${srcdir}/Barriers-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/Barriers-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}

