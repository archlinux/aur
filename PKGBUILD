# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: haha662 <haha662 at outlook dot com>

_pkgname=blogdown
_pkgver=1.24
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Create Blogs and Websites with R Markdown"
arch=("any")
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL3")
depends=("r" "hugo" "pandoc" "r-rmarkdown>=2.8" "r-bookdown>=0.22" "r-jsonlite" "r-later" "r-knitr>=1.25" "r-htmltools" "r-yaml>=2.1.19" "r-httpuv>=1.4.0" "r-xfun>=0.29" "r-servr>=0.21" )
# makedepends=()
optdepends=("r-testit" "r-shiny" "r-miniui" "r-stringr" "r-rstudioapi" "r-processx" "r-whoami" )
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha512sums=('bfd24f07c17033898284e6c261228eb9758f56ab7c2f34e60e000dccf76b57cddd3547496862a4d116d00e52c46a88436d27f31104474332f67c64a1cfc71f8b')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
