# Maintainer: Kashyap Chhatbar <first name [dot] cc [at] gmail [dot] com> 

_cranname=xaringanExtra
_cranver=0.8.0
_archivedate=2024-05-19
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
sha256sums=('45cb83bb5eccc8be6e2c942b8b5d6fd01fee67c1c477212fe993ed73212db2f0')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
