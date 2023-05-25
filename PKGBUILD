# Maintainer: decrypted.epsilon@gmail.com

_cranname=xaringanExtra
_cranver=0.7.0
_archivedate=2022-07-16
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Extras and Extensions for 'xaringan' Slides"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT custom)
depends=('r>=2.10' r-htmltools r-jsonlite r-knitr r-uuid)
optdepends=('r-testthat>=2.1.0' r-callr r-rmarkdown r-xaringan)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("04591fcd8a236799e392bbeb3182ab70bf237bbca22e3c5a0ac4f65a9c27d2ea")

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
