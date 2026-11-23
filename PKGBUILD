# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=factoextra
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='Extract and Visualize the Results of Multivariate Data Analyses'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dendextend
  r-factominer
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-rlang
)
optdepends=(
  r-ade4
  r-ca
  r-hardhat
  r-igraph
  r-knitr
  r-mass
  r-mclust
  r-parsnip
  r-recipes
  r-rmarkdown
  r-rtsne
  r-testthat
  r-umap
  r-uwot
  r-workflows
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f23e70ee4a976d37237d65bf9eed3982599c2e59257ce2afa2d329688ac97942')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
