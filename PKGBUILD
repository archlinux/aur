# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pracma
_pkgver=2.3.8
pkgname=r-${_pkgname,,}
pkgver=2.3.8
pkgrel=3
pkgdesc='Practical Numerical Math Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-nlcoptim
  r-quadprog
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2302d454406e72711714732658d0c59c9d5a1ead698f22ee23f38cba63d42764')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
