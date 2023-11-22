# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=basilisk
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=1.14.1
pkgrel=1
pkgdesc='Freezing Python Dependencies Inside Bioconductor Packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-basilisk.utils
  r-dir.expiry
  r-reticulate
)
optdepends=(
  r-biocstyle
  r-callr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('51a15b1bcf467c7d5b7bed039b9ed7a5013b4f29ee4c6ba8d1da5ae147f9c7ec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
