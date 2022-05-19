_pkgname=pzfx
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver}
pkgrel=1
pkgdesc='Import GraphPad Prism (pzfx) data in R'
arch=('any')
url="https://cran.r-project.org/web/packages/pzfx/vignettes/pzfx.html"
#https://cran.r-project.org/web/packages/pzfx/index.html
license=('LGPL')
depends=(
  r
  r-xml2
  r-testthat
  r-knitr
  r-rmarkdown
)
optdepends=(
  r-rio
)
source=("https://cran.r-project.org/src/contrib/pzfx_${_pkgver}.tar.gz")
sha256sums=('f9e9781900011be1c91db4e1381481d94eca565a00f18c8a449813322ddf0b39')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
