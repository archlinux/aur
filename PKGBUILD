# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=barriers
pkgver=1.6.0
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
sha256sums=('6eba175d237325e9b4493d7675e1da5edfd9beb6c21bd60c83ed64ad498bf7e3')

build() {
  cd "${srcdir}/Barriers-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/Barriers-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}

