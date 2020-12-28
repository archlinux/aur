# Maintainer: dhn <neilson+aur@sent.com>

_cranname=docopt
pkgname=r-$_cranname
pkgver=0.7.1
pkgrel=1
pkgdesc='Define a command-line interface by just giving it a description in the specific format.'
arch=('any')
url="https://cran.r-project.org/web/packages/$_cranname/"
license=('MIT')
depends=('r')
makedepends=('r-testthat')
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_$pkgver.tar.gz")
sha512sums=('a10d3aa8d1af323e3676e1b15e6d12d42cfec8efeed32fd2fb8f3b2d61ab691bfd990dc7f6c13f39348c9fb6a8ba67a4f8d3d5ccc854cb3c18ecfc319cb5a2f6')

build(){
    R CMD INSTALL ${_cranname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "${_cranname}" "$pkgdir"/usr/lib/R/library
}
