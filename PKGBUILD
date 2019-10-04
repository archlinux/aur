# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=hms
_cranver=0.5.1
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Implements an S3 class for storing and formatting time-of-day values, based on the 'difftime' class."
url="https://cran.r-project.org/package=hms"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r' 'r-pkgconfig' 'r-rlang' 'r-vctrs>=0.2.0')
optdepends=('r-crayon' 'r-lubridate' 'r-pillar' 'r-testthat')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('ddf5323d36067c51d9e5dcf5c8acf336') 

build() {
    cd ${srcdir}
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package(){
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
