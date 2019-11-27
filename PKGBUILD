# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=clipr
_cranver=0.7.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Read and Write from the System Clipboard."
url="https://cran.r-project.org/package=${_cranname}"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r')
optdepends=('r-covr' 'r-knitr' 'r-rmarkdown' 'r-rstudioapi' 'r-testthat')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
#source=("http://cran.r-project.org/src/contrib/Archive/${_cranname}/${_cranname}_${_cranver}.tar.gz" # uncomment if 404 error
md5sums=('2309a44a587573a739119e98d0f5e3b7') 

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
