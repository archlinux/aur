# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioCor
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Functional similarities'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocparallel
  r-gseabase
)
optdepends=(
  r-airway
  r-biocstyle
  r-boot
  r-deseq2
  r-gosemsim
  r-hmisc
  r-knitr
  r-org.hs.eg.db
  r-reactome.db
  r-rmarkdown
  r-spelling
  r-targetscan.hs.eg.db
  r-testthat
  r-wgcna
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f7cc5d35f3a26ce67487e8710a56bd7740c92b07d97ffff0dc72494013f488ab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
