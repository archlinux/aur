# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=basilisk
_pkgver=1.9.12
pkgname=r-${_pkgname,,}
pkgver=1.9.12
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
sha256sums=('de02a6e56d41719d204eba924312a2c145241e9729304cf2e9db98848e7fbf03')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
