# Contributor: Kibouo <csonka.mihaly@hotmail.com>
_cranname=hunspell
_cranver=3.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-hunspell
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Low level spell checker and morphological analyzer based on the famous 'hunspell' library <https://hunspell.github.io>.'
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-digest' 'r-rcpp')
optdepends=('r-testthat' 'r-spelling' 'r-pdftools' 'r-janeaustenr' 'r-wordcloud2' 'r-knitr' 'r-stopwords' 'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/Archive/${_cranname}/${_pkgtar}")
md5sums=('de549396ea2812d351667fe0272bd098')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
        
