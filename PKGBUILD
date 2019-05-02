# Contributor: Kibouo <csonka.mihaly@hotmail.com>
_cranname=askpass
_cranver=1.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-askpass
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Cross-platform utilities for prompting the user for credentials or a passphrase.'
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('a00d6599ff99f501534c1d965a1fd3b4')

build(){
    R CMD INSTALL openssl_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership openssl "$pkgdir"/usr/lib/R/library
}

