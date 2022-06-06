# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ppclust
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=1.1.0
pkgrel=4
pkgdesc='Probabilistic and Possibilistic Cluster Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-inaparc
)
optdepends=(
  r-cluster
  r-factoextra
  r-fclust
  r-knitr
  r-rmarkdown
  r-vegclust
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9bf672724d6f7a65f64b7ca268aa43bad066afe2cc7d1a1546c8c677bc94af6e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
