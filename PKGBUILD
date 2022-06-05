# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=depmixS4
_pkgver=1.5-0
pkgname=r-${_pkgname,,}
pkgver=1.5.0
pkgrel=4
pkgdesc='Dependent Mixture Models - Hidden Markov Models of GLMs and Other Distributions in S4'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rsolnp
)
optdepends=(
  r-gamlss
  r-gamlss.dist
  r-rdonlp2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('288ab5f08d5c10c8835de662cf3dfa8aee859b0385aaa5fd98da915a38dc4cdd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
