# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sampling
_pkgver=2.10
pkgname=r-${_pkgname,,}
pkgver=2.10
pkgrel=1
pkgdesc="Survey Sampling"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lpsolve
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fdec976ec0abfb5c690049d76f89ebcb8ab3650e2eb28a5b54c3984d17372775')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
#  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
