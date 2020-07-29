# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=xfun
_cranver=0.16
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Miscellaneous Functions by Yihui Xie'
arch=(i686 x86_64)
url='https://cran.r-project.org/package=xfun'
license=(MIT)
depends=(r)
optdepends=(r-testit r-rstudioapi r-tinytex r-mime r-markdown r-knitr r-htmltools r-remotes r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('b0797de70e240e632e75a7e9f1c6cef7')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
