# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dockerfiler
_pkgver=0.1.4
pkgname=r-${_pkgname,,}
pkgver=0.1.4
pkgrel=3
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
  r-pkgbuild
  r-r6
  r-remotes
  r-usethis
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ea2ea97938b9bc2d0f0390abc6abee330716b2eb8538a18ba855e82c7213a7bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
