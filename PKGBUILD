# Maintainer: dhn <neilson+aur@sent.com>

_pkgname=rsdmx
pkgname=r-$_pkgname
pkgver=0.6
pkgrel=1
pkgdesc='Tools for Reading SDMX Data and Metadata'
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL')
depends=('r' 'r-r6' 'r-xml' 'r-httr' 'r-plyr')
makedepends=()
optdepends=('r-testthat' 'r-knitr' 'r-roxygen2' 'r-markdown')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('bc3150f521d24ac0c6552ab1de33d5026d610d736e5bc9025eba986d60735be9f8fd7c88d04e415b89e3f52a47ebcaa47946c7689f76bd632b76f6abcc30253e')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
