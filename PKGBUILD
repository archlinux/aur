# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=devtools
_cranver=2.3.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools to Make Developing R Packages Easier"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.0.2' 'r-usethis>=1.6.0' 'r-callr>=3.4.3' 'r-cli>=2.0.2' 'r-covr>=3.5.0' 'r-crayon>=1.3.4' 'r-desc>=1.2.0' 'r-digest>=0.6.25' 'r-dt>=0.13' 'r-ellipsis>=0.3.0' 'r-glue>=1.4.0' 'r-git2r>=0.26.1' 'r-httr>=1.4.1' 'r-jsonlite>=1.6.1' 'r-memoise>=1.1.0' 'r-pkgbuild>=1.0.6' 'r-pkgload>=1.0.2' 'r-rcmdcheck>=1.3.3' 'r-remotes>=2.1.1' 'r-rlang>=0.4.5' 'r-roxygen2>=7.1.0' 'r-rstudioapi>=0.11' 'r-rversions>=2.0.1' 'r-sessioninfo>=1.1.1' 'r-testthat>=2.3.2' 'r-withr>=2.1.2')
optdepends=(r-biocmanager r-curl r-foghorn r-gmailr r-knitr r-lintr r-mockery r-pingr r-pkgdown r-rhub r-rmarkdown r-spelling)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('3f349fbcf4c87cedd75b8b217993ba2b')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
