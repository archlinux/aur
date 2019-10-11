# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=lifecycle
_cranver=0.1.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Manage the lifecycle of your exported functions with shared conventions, documentation badges, and non-invasive deprecation warnings."
url="https://cran.r-project.org/package=lifecycle"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r>=3.2' 'r-glue' 'r-rlang>=0.4.0')
optdepends=('r-covr' 'r-crayon' 'r-knitr' 'r-markdown' 'r-testthat')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('a039f080eb1dc67a40ce92ddced20cac') 

build() {
    cd ${srcdir}
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
