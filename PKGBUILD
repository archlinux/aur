# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=knitr
_cranver=1.27
pkgname=r-knitr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A General-Purpose Package for Dynamic Report Generation in R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL-2' 'GPL-3')
depends=('r>=3.2.3' 'r-evaluate>=0.10' 'r-highr' 'r-markdown' 'r-stringr>=0.6' 'r-yaml>=2.1.19' 'r-xfun')
optdepends=('pandoc' 'rst2pdf' 'r-formatr' 'r-testit' 'r-digest' 'r-rgl' 'r-codetools' 'r-rmarkdown' 'r-htmlwidgets' 'r-webshot' 'r-tikzdevice' 'r-tinytex' 'r-reticulate' 'r-juliacall' 'r-magick' 'r-png' 'r-jpeg' 'r-gifski' 'r-xml2' 'r-httr' 'r-dbi' 'r-showtext' 'r-tibble' 'r-sass' 'r-styler')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('2834fa5bece1893c998845a66ce41f6c')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
