# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=xfun
_cranver=0.15
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Miscellaneous Functions by Yihui Xie'
arch=(i686 x86_64)
url='https://cran.r-project.org/package=xfun'
license=(MIT)
depends=(r)
makedepends=(gcc)
optdepends=(r-testit r-rstudioapi r-tinytex r-mime r-markdown r-knitr r-htmltools r-remotes r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('3cff8e23b7dea2956c33e4d43f7a46ad')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
