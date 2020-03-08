# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=devtools
_cranver=2.2.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools to Make Developing R Packages Easier"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.0.2' 'r-usethis>=1.5.0' r-callr r-cli 'r-covr>=3.2.0' r-crayon r-desc r-digest r-dt 'r-ellipsis>=0.3.0' r-glue 'r-git2r>=0.23.0' 'r-httr>=0.4' r-jsonlite 'r-memoise>=1.0.0' 'r-pkgbuild>=1.0.3' 'r-pkgload>=1.0.2' 'r-rcmdcheck>=1.3.3' 'r-remotes>=2.1.1' r-rlang 'r-roxygen2>=6.1.1' 'r-rstudioapi>=0.7' r-rversions 'r-sessioninfo>=1.1.1' 'r-testthat>=2.1.1' r-withr)
optdepends=(r-biocmanager r-bitops r-curl r-evaluate r-foghorn r-gmailr r-knitr r-lintr r-mockery r-pingr r-pkgdown r-rcpp r-rhub r-rmarkdown r-spelling r-whisker)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('b520d1cd069f6926a9f4afd7c495ca51')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
