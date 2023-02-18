# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reldist
_pkgver=1.7-2
pkgname=r-${_pkgname,,}
pkgver=1.7.2
pkgrel=1
pkgdesc='Relative Distribution Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-densestbayes
)
optdepends=(
  r-locfit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d9086cbc14ed7c65d72da285b86a07e77cbfebc478ba7327b769bd08549229c9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
