# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=capushe
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=1.1.2
pkgrel=1
pkgdesc='CAlibrating Penalities Using Slope HEuristics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('67258c925ee1faabc58f9952692880372544314e8463a8b8071e561c9bd35fd5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
