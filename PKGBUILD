# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=xfun
_cranver=0.28
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Supporting Functions for Packages Maintained by "Yihui Xie"'
arch=(i686 x86_64)
url='https://cran.r-project.org/package=xfun'
license=(MIT)
depends=(r)
optdepends=(r-testit r-rstudioapi r-tinytex r-mime r-markdown r-knitr r-htmltools r-remotes r-pak r-rhub r-renv r-curl r-jsonlite r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('0b5be439de8bceb166d98de956eacc7c723378f8af8feef8169ca40c0a683b32')

build(){
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
