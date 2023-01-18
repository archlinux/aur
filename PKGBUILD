# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dockerfiler
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=0.2.1
pkgrel=1
pkgdesc='Easy Dockerfile Creation from R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-attempt
  r-cli
  r-desc
  r-fs
  r-glue
  r-jsonlite
  r-pak
  r-pkgbuild
  r-r6
  r-remotes
  r-renv
  r-usethis
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('77cbbb05265b22c7fdd5fba06caf294fc3f02c4f92faefa3102f57d9c6a9bd5a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
