# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IMAS
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Integrative analysis of Multi-omics data for Alternative Splicing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biocparallel
  r-doparallel
  r-foreach
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggfortify
  r-ggplot2
  r-gridextra
  r-iranges
  r-ivas
  r-lme4
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2061a7d9ac434ba614382b4060247082cc0804ffb4de2d1d79cdebc0599af927')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
