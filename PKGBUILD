# Maintainer: haha662 <haha662 at outlook dot com>

_cranname=blogdown
_cranver=0.17
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Create Blogs and Websites with R Markdown"
arch=("any")
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
depends=("r" "hugo" "pandoc" "r-rmarkdown>=1.16" "r-bookdown>=0.14" "r-knitr>=1.25" "r-htmltools" "r-yaml>=2.1.19" "r-httpuv>=1.4.0" "r-xfun>=0.10" "r-servr>=0.15" )
# makedepends=()
optdepends=("r-testit" "r-shiny" "r-miniui" "r-stringer" "r-rstudioapi" "r-processx" "r-later" )
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("798ce9ee38dabddaf2b893a3d6f1ee8bd518aab8c7893a4bd2fbaa44dbd44ec6")

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
