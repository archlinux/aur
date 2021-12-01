# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=devtools
_cranver=2.4.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools to Make Developing R Packages Easier"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.0.2' 'r-usethis>=2.0.1' 'r-callr>=3.6.0' 'r-cli>=3.0.0' 'r-desc>=1.3.0' 'r-ellipsis>=0.3.1' 'r-fs>=1.5.0' 'r-httr>=1.4.2' 'r-lifecycle>=1.0.0' 'r-memoise>=2.0.0' 'r-pkgbuild>=1.2.0' 'r-pkgload>=1.2.1' 'r-rcmdcheck>=1.3.3' 'r-remotes>=2.3.0' 'r-rlang>=0.4.10' 'r-roxygen2>=7.1.1' 'r-rstudioapi>=0.13' 'r-rversions>=2.0.2' 'r-sessioninfo>=1.1.1' 'r-testthat>=3.0.2' 'r-withr>=2.4.1')
optdepends=(r-biocmanager r-covr r-curl r-digest r-dt r-foghorn r-gh r-gmailr r-knitr r-lintr r-mockery r-pingr r-pkgdown r-rhub r-rmarkdown r-spelling)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('e42159a9bca0b219170e76c282862e27ca283649d6cbf6a868175d8982e06b4f')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
