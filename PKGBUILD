_pkgname=bff
_pkgver=4.3.0
pkgname=r-${_pkgname,,}
pkgver=4.3.0
pkgrel=3
pkgdesc='Bayes Factor Functions'
arch=('any')
url="https://github.com/rshudde/${_pkgname}"
license=('GPL2')
depends=(
  r
  r-grdevices
  r-ggplot2
  r-matrix
  r-gsl
  r-stats
  r-rlang
)
optdepends=(
  r-testthat
  r-knitr
  r-rmarkdown
  r-bsda
  r-vdiffr
)
makedepends=('git')
source=("git+https://github.com/rshudde/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  mkdir -p ${srcdir}/usr/lib/R/library
  R -e "install.packages('${srcdir}/${_pkgname}',\
     type='source', repos=NULL,lib='${srcdir}/usr/lib/R/library', INSTALL_opts='--no-multiarch --no-docs --no-test-load')"
}

package() {

  cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
}
