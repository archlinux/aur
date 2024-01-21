# system requirements: gmp (>= 4.2.3), mpfr (>= 3.0.0), pdfcrop (part ofTexLive) is required to rebuild the vignettes.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmpfr
_pkgver=0.9-5
pkgname=r-${_pkgname,,}
pkgver=0.9.5
pkgrel=1
pkgdesc='R MPFR - Multiple Precision Floating-Point Reliable'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gmp
)
optdepends=(
  r-bessel
  r-dfoptim
  r-dpq
  r-mass
  r-polynom
  r-pracma
  r-sfsmisc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bce9a2729efcd329a13910e2ecb4675b4626dd3322cd01b01cb835d516a5f31b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
