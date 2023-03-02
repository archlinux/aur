# system requirements: pandoc, apparmor (optional)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=opencpu
_pkgver=2.2.9
pkgname=r-${_pkgname,,}
pkgver=2.2.9
pkgrel=1
pkgdesc='Producing and Reproducing Results'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-brew
  r-curl
  r-evaluate
  r-httpuv
  r-jsonlite
  r-knitr
  r-mime
  r-openssl
  r-protolite
  r-rappdirs
  r-remotes
  r-sys
  r-webutils
  r-zip
  pandoc
)
optdepends=(
  apparmor
  r-arrow
  r-haven
  r-pander
  r-r.rsp
  r-svglite
  r-unix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('13e3d1976caf3b3b34bd8b95294868ac0ade3e73a3511354625fa4a863c874a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
