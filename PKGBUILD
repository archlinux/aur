# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qqman
_pkgver=0.1.9
pkgname=r-${_pkgname,,}
pkgver=0.1.9
pkgrel=1
pkgdesc='Q-Q and Manhattan Plots for GWAS Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-calibrate
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3f6a931771d375174b78f220471ddd601def9b5c69631931b0992ebbc8c5bc13')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
