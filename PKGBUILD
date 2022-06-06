# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NCmisc
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=1.1.6
pkgrel=4
pkgdesc='Miscellaneous Functions for Creating Adaptive Functions and Scripts'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-proftools
)
optdepends=(
  r-kernsmooth
  r-matrix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2aa85997d5ec2222e610604022684c004a4925241761d9a0104919f1cf3a8c79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
