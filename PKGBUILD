# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=multcomp
_cranver=1.4-13
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Simultaneous Inference in General Parametric Models"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=(r 'r-mvtnorm>=1.0.10' 'r-th.data>=1.0.2' 'r-sandwich>=2.3.0')
optdepends=(r-lme4 r-robustbase r-coin r-xtable r-lmtest r-coxme r-simcomp r-iswr r-tram)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('333196ff40484dcab27ef77e62be193a')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}


