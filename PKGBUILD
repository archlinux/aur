# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R.rsp
_pkgver=0.46.0
pkgname=r-${_pkgname,,}
pkgver=0.46.0
pkgrel=1
pkgdesc='Dynamic Generation of Scientific Reports'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-digest
  r-r.cache
  r-r.methodss3
  r-r.oo
  r-r.utils
)
optdepends=(
  r-ascii
  r-base64enc
  r-knitr
  r-markdown
  r-r.devices
  r-tcltk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a9f680ffe563abdaa91add6ebf5e6c0ecbe57f0d39687bcb272ff2a987c33bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
