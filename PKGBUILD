# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>
_cranver=0.8
pkgname=r-rstudioapi
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Safely Access the RStudio API'
arch=('any')
url='https://cran.r-project.org/package=rstudioapi'
license=('MIT')
depends=('r' )
optdepends=('r-testthat' 'r-knitr' 'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/Archive/${_cranname}/${_pkgtar}")
md5sums=('7601abbffcade9bdba3aa982c2c2625a')

build(){
    R CMD INSTALL rstudioapi_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership rstudioapi "$pkgdir"/usr/lib/R/library
}

