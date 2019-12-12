# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=spam
_cranver=2.5-1
pkgname=r-${_cranname}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="SPArse Matrix"
arch=('i686' 'x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL2')
depends=('r>=3.1' 'r-dotcall64')
makedepends=('gcc-fortran')
optdepends=('r-spam64' 'r-fields' 'r-sparsem' 'r-testthat' 'r-r.rsp' 'r-truncdist' 'r-knitr' 'r-rmarkdown')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('c6dc0cc6c2701ff7ca67d5b4b4bbc87e')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
