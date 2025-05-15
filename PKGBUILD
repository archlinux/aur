# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MinimumDistance
_pkgver=1.52.1
pkgname=r-${_pkgname,,}
pkgver=1.52.1
pkgrel=1
pkgdesc='A Package for De Novo CNV Detection in Case-Parent Trios'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-data.table
  r-dnacopy
  r-ff
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-matrixgenerics
  r-matrixstats
  r-oligoclasses
  r-s4vectors
  r-summarizedexperiment
  r-vanillaice
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg18
  r-bsgenome.hsapiens.ucsc.hg19
  r-dosnow
  r-human610quadv1bcrlmm
  r-runit
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('86cc1544678bf1143ec65b6b1d1f1d17bdcf30bb91274d55438a47424741c637')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
