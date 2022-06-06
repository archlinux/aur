# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNOmni
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=1.0.0
pkgrel=4
pkgdesc='Rank Normal Transformation Omnibus Test'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-plyr
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-r.rsp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b4ea6b98167dff4632d9d546368cb652d291641f6b45cea1aec6fe6b9f6c0fe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
