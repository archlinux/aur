# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=gld
_cranver=2.6.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Estimation and Use of the Generalised (Tukey) Lambda Distribution"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=(r r-e1071 r-lmom)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('0db6daee1b6e256d64d292c1f6795c505677331dcf2f97e04e264566ded93323')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
