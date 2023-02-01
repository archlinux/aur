# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RJSONIO
_pkgver=1.3-1.8
pkgname=r-${_pkgname,,}
pkgver=1.3.1.8
pkgrel=1
pkgdesc='Serialize R Objects to JSON, JavaScript Object Notation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f6f0576d3c7852b16295dfc897feebca064fe5dd29cdce7592f94c56823553f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
