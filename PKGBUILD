# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=xfun
_cranver=0.27
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Supporting Functions for Packages Maintained by "Yihui Xie"'
arch=(i686 x86_64)
url='https://cran.r-project.org/package=xfun'
license=(MIT)
depends=(r)
optdepends=(r-testit r-rstudioapi r-tinytex r-mime r-markdown r-knitr r-htmltools r-remotes r-pak r-renv r-curl r-jsonlite r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('c775bf33a6bc57f8022960cbf7dc20a4e82175a9c71807b2723f46ade6805485')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
