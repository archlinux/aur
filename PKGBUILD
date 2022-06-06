# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmisc
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=1.5.1
pkgrel=1
pkgdesc='Rmisc: Ryan Miscellaneous'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-plyr
)
optdepends=(
  r-hmisc
  r-latticeextra
  r-stats4
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1d65d5c8f93448924acb13dfb95dd419b6b2325c49da53394d15fac93b58d2c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
