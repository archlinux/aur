# system requirements: gsl. Note: users should have GSL installed. Windowsusers: 'consult the README file available in the inst directoryof the source distribution for necessary configurationinstructions'.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GLAD
_pkgver=2.60.0
pkgname=r-${_pkgname,,}
pkgver=2.60.0
pkgrel=1
pkgdesc='Gain and Loss Analysis of DNA'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-aws
  gsl
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bf00850efc7a19f61cf3ca825a48f7206e8339e036ce465a7ddc1f6059645509')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
