# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pdist
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=1.2.1
pkgrel=1
pkgdesc='Partitioned Distance Function'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('06904ee8c609cebd62553b5593c5d4e08abd3ed95b9f96c64e47c380a2466f2f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
