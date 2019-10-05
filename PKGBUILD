# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=htmlwidgets
_cranver=1.5
pkgname=r-${_cranname}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="HTML Widgets for R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-htmltools>=0.3' 'r-jsonlite>=0.9.16' 'r-yaml')
optdepends=('r-knitr>=1.8')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('602279699676893f448aad89b75ce0e5')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
