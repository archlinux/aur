# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RhpcBLASctl
_pkgver=0.23-42
pkgname=r-${_pkgname,,}
pkgver=0.23.42
pkgrel=1
pkgdesc="Control the Number of Threads on 'BLAS'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('AGPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5c889d5b69e264060b9f1f0383c447f594855b8afc15b7d76d39e4d62b946615')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
