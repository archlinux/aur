# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ttservice
_pkgver=0.3.6
pkgname=r-${_pkgname,,}
pkgver=0.3.6
pkgrel=1
pkgdesc='A Service for Tidy Transcriptomics Software Suite'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
)
optdepends=(
  r-methods
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eb8eec2e3216df490c639c80ca9bc03309b6c351d2f0cf7ac8c8345b50d5a184')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
