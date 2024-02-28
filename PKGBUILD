# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tractor.base
_pkgver=3.4.2
pkgname=r-${_pkgname,,}
pkgver=3.4.2
pkgrel=1
pkgdesc='Read, Manipulate and Visualise Magnetic Resonance Images'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ore
  r-reportr
  r-rnifti
  r-shades
)
optdepends=(
  r-divest
  r-jsonlite
  r-loder
  r-mmand
  r-oro.nifti
  r-testthat
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('43596347d32b7a00a6323aae9727358ef3890e592c8d7b3e5102b1c34c2fb78a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
