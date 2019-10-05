# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=psych
_cranver=1.8.12
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Procedures for psychological, psychometric, and personality research."
url="https://cran.r-project.org/package=psych"
arch=('i686' 'x86_64')
license=('GPL-2' 'GPL-3')
depends=('r-mnormt' 'r>=2.10')
optdepends=('r-gparotation' 'r-lavaan' 'r-sem' 'r-lme4' 'r-rcsdp' 'r-graph' 'r-graphviz')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('d5f5738cd3e8eb931acd11b428e25a45') 

build() {
    cd ${srcdir}
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
