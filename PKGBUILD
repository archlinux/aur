# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TCC
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='TCC: Differential expression analysis for tag count data with robust normalization strategies'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayseq
  r-deseq2
  r-edger
  r-roc
)
optdepends=(
  r-biocgenerics
  r-runit
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d7f438f054eee05c026936a37e392c304b249752c90db6f865f3f0010f362b49')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
