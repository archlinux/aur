# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=globaltest
_pkgver=5.58.0
pkgname=r-${_pkgname,,}
pkgver=5.58.0
pkgrel=1
pkgdesc='Testing Groups of Covariates/Features for Association with a Response Variable, with Applications to Gene Set Testing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
)
optdepends=(
  r-boot
  r-go.db
  r-golubesets
  r-gseabase
  r-gss
  r-hu6800.db
  r-keggrest
  r-lungexpression
  r-mass
  r-mstate
  r-org.hs.eg.db
  r-penalized
  r-rgraphviz
  r-rpart
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85242a695aab61081a39a75bff818ecc783d21dc78cd6b808e2ba6cb64d0fbb2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
