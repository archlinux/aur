# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChAMPdata
_pkgver=2.44.0
pkgname=r-${_pkgname,,}
pkgver=2.44.0
pkgrel=1
pkgdesc='Data Packages for ChAMP package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-genomicranges
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4ac82671c9395e514f11f5e8e64bc6436be5dda3e03b9129d663dd0659036407')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
