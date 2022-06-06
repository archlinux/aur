# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Uniquorn
_pkgver=2.16.0
pkgname=r-${_pkgname,,}
pkgver=2.16.0
pkgrel=1
pkgdesc='Identification of cancer cell lines based on their weighted mutational/ variational fingerprint'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-doparallel
  r-foreach
  r-genomicranges
  r-iranges
  r-r.utils
  r-stringr
  r-variantannotation
  r-writexls
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dc45fa5408eaef35ad8f6e753ee2ba37bfc277df1ae215384e5c02ae807ec241')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
