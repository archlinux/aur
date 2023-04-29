# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ffpe
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Quality assessment and control for FFPE microarray expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
  r-biocgenerics
  r-lumi
  r-methylumi
  r-sfsmisc
  r-ttr
)
optdepends=(
  r-ffpeexampledata
  r-genefilter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a473e4c233775b8c4795d53476dc26fcdccd309040e60fc203bce2bd1641cc73')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
