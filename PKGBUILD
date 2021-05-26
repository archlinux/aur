# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=reprex
_cranver=2.0.0
pkgname=r-reprex
pkgver=${_cranver//[:-]/.}
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgrel=3
pkgdesc='Prepare Reproducible Example Code via the Clipboard'
arch=('any')
url='https://cran.r-project.org/package=reprex'
license=('MIT')
depends=('r>=3.3' 'r-callr>=3.6.0' 'r-clipr>=0.4.0' 'r-fs' 'r-glue' 'r-knitr>=1.23' 'r-rlang>=0.4.0' 'r-rmarkdown' 'r-rstudioapi' 'r-withr')
optdepends=('pandoc>=2.0' 'r-covr' 'r-devtools' 'r-fortunes' 'r-knitr' 'r-miniui' 'r-mockr' 'r-rprojroot' 'r-sessioninfo' 'r-shiny' 'r-spelling' 'r-styler>=1.2.0' 'r-testthat>=3.0.2')
sha256sums=('905377fcc644a485e97caffda3b077f6b3ad8fda09c0bbf378c422e13feb96d1')
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
