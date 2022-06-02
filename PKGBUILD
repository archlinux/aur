# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=deSolve
_cranver=1.32
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Solvers for Initial Value Problems of Differential Equations ('ODE', 'DAE', 'DDE')"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=4.0.0')
makedepends=(gcc-fortran)
optdepends=(r-scatterplot3d r-fme)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=("9d1f1f73dc25670b21bfb789dacab2d95470a317aaa2ab0ecbc85bdd302aab4d07c504b140e2de4e6b8fa4a6fe368f33716a7c66eb0c01415b95e919f93fa22d")

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
