# Maintainer: haha662 <haha662 at outlook dot com>
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=rmarkdown
_cranver=2.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Dynamic Documents for R"
arch=("any")
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
depends=("r>=3.0.0" "pandoc>=1.12.3" "r-knitr>=1.22" "r-yaml>=2.1.19" "r-htmltools>=0.3.5" "r-evaluate>=0.13" "r-base64enc" "r-jsonlite" "r-mime" "r-tinytex>=0.11" "r-xfun" "r-stringr>=1.2.0")
# makedepends=()
optdepends=("r-shiny>=0.11" "r-tufte" "r-testthat" "r-digest" "r-dygraphs" "r-tibble" "r-fs" "r-pkgdown" "r-rsconnect")
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("51423dcae7284860c99744422dabd7a3bc12bd9913a17244157976cf26c1b26d")

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
