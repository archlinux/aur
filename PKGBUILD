# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=reprex
_cranver=2.0.2
pkgname=r-reprex
pkgver=${_cranver//[:-]/.}
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgrel=1
pkgdesc='Prepare Reproducible Example Code via the Clipboard'
arch=('any')
url='https://cran.r-project.org/package=reprex'
license=('MIT')
depends=('r>=3.4' 'pandoc>=2.0' 'r-callr>=3.6.0' 'r-cli>=3.2.0' 'r-clipr>=0.4.0' 'r-fs' 'r-glue' 'r-knitr>=1.23' 'r-lifecycle' 'r-rlang>=1.0.0' 'r-rmarkdown' 'r-rstudioapi' 'r-withr>=2.3.0')
optdepends=( 'r-covr' 'r-fortunes'  'r-miniui' 'r-mockr' 'r-rprojroot' 'r-sessioninfo' 'r-shiny' 'r-spelling' 'r-styler>=1.2.0' 'r-testthat>=3.0.2')
sha1sums=('35537ec74176b4f09e50867ca16b4c28f5b82eff')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")


build(){
    cd "${srcdir}"
    R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
    cd "${scrdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
