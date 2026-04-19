# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: haha662 <haha662 at outlook dot com>

_cranname=blogdown
_cranver=1.23
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Create Blogs and Websites with R Markdown"
arch=("any")
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
depends=("r" "hugo" "pandoc" "r-rmarkdown>=2.8" "r-bookdown>=0.22" "r-jsonlite" "r-later" "r-knitr>=1.25" "r-htmltools" "r-yaml>=2.1.19" "r-httpuv>=1.4.0" "r-xfun>=0.29" "r-servr>=0.21" )
# makedepends=()
optdepends=("r-testit" "r-shiny" "r-miniui" "r-stringr" "r-rstudioapi" "r-processx" "r-whoami" )
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=("15f1f15fd62f84e60d4dcd58f6eb04e0a22c3c16f1eebb078d6b90387ce9ceb79daf618ba10cdf7db0dde08c156cf5a9e2f5ab91005c4ddd4838e622a0125ffe")

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
