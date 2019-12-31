# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=psych
_cranver=1.9.12
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Procedures for psychological, psychometric, and personality research."
url="https://cran.r-project.org/package=psych"
arch=('any')
license=('GPL-2' 'GPL-3')
depends=('r' 'r-mnormt')
optdepends=('r-gparotation' 'r-lavaan' 'r-sem' 'r-lme4' 'r-rcsdp' 'r-graph' 'r-graphviz' 'r-psychtools')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
#source=("http://cran.r-project.org/src/contrib/Archive/${_cranname}/${_cranname}_${_cranver}.tar.gz") # uncomment if 404 error
md5sums=('c2d2bd58814e3963be8b19926392f739') 

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
