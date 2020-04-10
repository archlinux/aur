# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contribitor: frichtlm <frichtlm@gmail.com>
# Contribitor: wagnerflo <florian@wagner-flo.net>

_cranname=reshape2
_cranver=1.4.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Flexibly Reshape Data: A Reboot of the Reshape Package"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1' 'r-plyr>=1.8.1' r-rcpp r-stringr)
makedepends=(gcc)
optdepends=(r-covr r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('ab6b937ba184817a8f33690b5ed6ffcb')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
