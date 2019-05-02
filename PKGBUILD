# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=knitr
_cranver=1.22
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

source=("https://cran.r-project.org/src/contrib/Archive/${_cranname}/${_pkgtar}")
md5sums=('da6b7c721871d7b079fb5f279f00fe5b')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

