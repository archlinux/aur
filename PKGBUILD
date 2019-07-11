# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

_cranname=carData
_cranver=3.0-2
pkgname=r-cardata
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Datasets to Accompany J. Fox and S. Weisberg, An R Companion to Applied Regression, Third Edition, Sage (forthcoming).'
arch=('x86_64')
url='https://cran.r-project.org/package=${_cranname}'
license=('GPL2' 'GPL3')
depends=('r')
source=("https://cran.r-project.org/src/contrib/${_cranname}_$_cranver.tar.gz")
md5sums=('c21eb4fe8866bae243899294abd851b1')

build(){
    R CMD INSTALL "${_cranname}_$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}
