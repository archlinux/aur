# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=Formula
_cranver=1.2-3
pkgname=r-formula
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Extended Model Formulas"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('861ccadaeca8b1fd16ec6857cc3dcb5b')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
