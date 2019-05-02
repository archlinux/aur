# Contributor: Kibouo <csonka.mihaly@hotmail.com>
_cranname=spelling
_cranver=2.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-spelling
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Spell checking common document formats including latex, markdown, manual pages, and description files.'
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-commonmark' 'r-xml2' 'r-hunspell>=3.0' 'r-knitr')
optdepends=('r-pdftools')
source=("https://cran.r-project.org/src/contrib/Archive/${_cranname}/${_pkgtar}")
md5sums=('e7758038652a039fc3404f7ba6930a21')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
        
