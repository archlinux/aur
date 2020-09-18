# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=devtools
_cranver=2.3.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools to Make Developing R Packages Easier"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.0.2' 'r-usethis>=1.6.3' 'r-callr>=3.4.4' 'r-cli>=2.0.2' 'r-covr>=3.5.1' 'r-desc>=1.2.0' 'r-dt>=0.15' 'r-ellipsis>=0.3.1' 'r-httr>=1.4.2' 'r-jsonlite>=1.7.1' 'r-memoise>=1.1.0' 'r-pkgbuild>=1.1.0' 'r-pkgload>=1.1.0' 'r-rcmdcheck>=1.3.3' 'r-remotes>=2.2.0' 'r-rlang>=0.4.7' 'r-roxygen2>=7.1.1' 'r-rstudioapi>=0.11' 'r-rversions>=2.0.2' 'r-sessioninfo>=1.1.1' 'r-testthat>=2.3.2' 'r-withr>=2.2.0')
optdepends=(r-biocmanager r-curl r-digest r-foghorn r-gmailr r-knitr r-lintr r-mockery r-pingr r-pkgdown r-rhub r-rmarkdown r-spelling)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('e5086106baef6bb925445dfdddb3cd5ff4f8fff96353365b135aba5618d1986d')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
