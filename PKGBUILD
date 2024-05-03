# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=myvariant
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Accesses MyVariant.info variant query and annotation services'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-genomeinfodb
  r-hmisc
  r-httr
  r-jsonlite
  r-magrittr
  r-plyr
  r-s4vectors
  r-variantannotation
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5f7b8e61ead9a5384385785d70f765fa5b45291971bff2fc664c2fa8f6e802b9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
