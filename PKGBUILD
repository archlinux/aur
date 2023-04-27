# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiClust
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='multiClust: An R-package for Identifying Biologically Relevant Clusters in Cancer Transcriptome Profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-amap
  r-ctc
  r-dendextend
  r-mclust
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-geoquery
  r-gplots
  r-knitr
  r-preprocesscore
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bda99fdbc1cfe709a94cbf21a451f37e3e7527b79641c0b52cdda4fa484df667')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
