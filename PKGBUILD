# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=timeDate
_cranver=3043.102
_cransrc="${_cranname}"_"${_cranver}".tar.gz
pkgname=r-timedate
pkgver=${_cranver}
pkgrel=3
pkgdesc="Rmetrics - Chronological and Calendar Objects"
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
license=('GPL3')
depends=('r')
# optdepends on date and RUnit
source=("https://cran.r-project.org/src/contrib/${_cransrc}")
md5sums=('7808ada851cbf740b1360cabca0706ff')
replaces=("r-cran-timedate")

build(){
    Rscript -e "install.packages(\"${_cranname}_${_cranver}.tar.gz\", lib=\"$srcdir\", repos=NULL)"
}

package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
