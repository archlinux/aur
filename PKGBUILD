# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=xfun
_cranver=0.26
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
sha256sums=('9e2680489b7c86794bdb1ec2fdf1bb5927120d1439f0347b09d2cfdf00d027a5')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
