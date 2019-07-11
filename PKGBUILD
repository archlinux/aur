# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

_cranname=pbkrtest
_cranver=0.4-7
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-pbkrtest
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Parametric Bootstrap and Kenward Roger Based Methods for Mixed Model Comparison"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2' 'GPL3')
depends=('r>=3.2.3' 'r-lme4>=1.1.10')
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('4c99b91ffbc441e2efdbd9258cb0ea16')

build(){
    R CMD INSTALL "${_pkgtar}" -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}


