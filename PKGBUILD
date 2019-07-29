# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=knitr
_cranver=1.23
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-knitr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A General-Purpose Package for Dynamic Report Generation in R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL-2' 'GPL-3')
depends=('r' 'r-evaluate>=0.10' 'r-highr' 'r-markdown' 'r-stringr>=0.6' 'r-yaml' 'r-xfun')

optdepends=('pandoc' 'r-formatr' 'r-testit' 'r-digest' 'r-rgl' 'r-rmarkdown' 'r-htmlwidgets' 'r-webshot' 'r-tikzdevice' 'r-tinytex' 'r-reticulate' 'r-juliacall' 'r-png' 'r-jpeg' 'r-xml2' 'r-httr' 'r-dbi' 'r-showtext' 'r-tibble')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('3fc90a5ba07b978566883dd1c5cd3cd7')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

