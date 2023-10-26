# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AGDEX
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='Agreement of Differential Expression Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-gseabase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3a88e42ed2896d24138b8cbbd79ddb8db938f08cdedfcc6d43797038c725e71b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
