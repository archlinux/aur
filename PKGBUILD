# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nondetects
_pkgver=2.38.1
pkgname=r-${_pkgname,,}
pkgver=2.38.1
pkgrel=1
pkgdesc='Non-detects in qPCR data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-arm
  r-biobase
  r-htqpcr
  r-limma
  r-mvtnorm
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7db6d67fcf5731c0c31741dd7133f40917ee29e73e78452657f8491bbd685fa6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
