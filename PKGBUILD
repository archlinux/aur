# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=barriers
pkgver=1.5.2
pkgrel=1
pkgdesc="Compute local minima and energy barriers of a landscape"
arch=('armv7h' 'x86_64' 'i686')
license=('Custom')
url="http://www.tbi.univie.ac.at/RNA/Barriers"
depends=()
optdepends=('viennarna: Generate sets of suboptimal RNA secondary structures with RNAsubopt'
            'treekin: Compute folding dynamics using barriers generated transition rates')
makedepends=()
provides=()
source=(http://www.tbi.univie.ac.at/RNA/Barriers/Barriers-${pkgver}.tar.gz)
md5sums=('a2f214f41a2f7af1d9380803d5fea441')

build() {
  cd "${srcdir}/Barriers-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/Barriers-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}

