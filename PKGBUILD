# Maintainer: Matt Frichtl <frichtlm@gmail.com>
_cranname=Rcpp
_cranver=1.0.3
pkgname=r-rcpp
pkgver=${_cranver}
pkgrel=1
pkgdesc="Seamless R and C++ Integration"
url="https://cran.r-project.org/package=Rcpp"
arch=('i686' 'x86_64')
license=('GPL-2' 'GPL-3')
depends=('r>=3.0.0')
optdepends=('r-runit' 'r-inline' 'r-rbenchmark' 'r-knitr' 'r-rmarkdown' 'r-pinp' 'r-pkgkitten')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
#source=("http://cran.r-project.org/src/contrib/Arcive/${_cranname}_${_cranver}.tar.gz") # uncomment if 404 error
md5sums=('0171ac73ab1635df72395dcc5450d48d')

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
