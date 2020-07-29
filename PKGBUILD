# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranname=rstan
_cranver=2.21.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Interface to Stan"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.4.0' 'r-stanheaders>=2.21.0' 'r-ggplot2>=3.0.0' r-inline 'r-gridextra>=2.0.0' 'r-rcpp>=0.12.0' 'r-rcppparallel>=5.0.1' 'r-loo>=2.3.0' r-pkgbuild r-withr r-v8 'r-rcppeigen>=0.3.3.3.0' 'r-bh>=1.72.0.2' pandoc)
makedepends=(gcc make)
optdepends=(r-runit r-shinystan r-bayesplot r-rmarkdown r-rstantools r-rstudioapi r-knitr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('3d1eb4f218da2a9d915f092e82add2a7')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
