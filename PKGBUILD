# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=basilisk
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=1.8.1
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
sha256sums=('f34a74870c59e84c3594eb2cab09a4a58ed6e994523cdb063a87161c458f9d8c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
