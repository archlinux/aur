# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=r-swirl
pkgver=2.4.3
pkgrel=1
pkgdesc='Platform for learning (and teaching) statistics and R simultaneously and interactively'
arch=('x86_64')
url='https://github.com/swirldev/swirl'
license=('GPL')
depends=('r' 'r-digest' 'r-httr' 'r-rcurl' 'r-stringr' 'r-yaml')
makedepends=('r-testthat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('68e016ddded48254bcf4ca2542e9c983d96c2d6d5654ad03c987e5baf73a568c4e7ff2d025c1938a9b6656def5aeba1220243b746b27b83345134b9a27d4c6f0')

build(){
    R CMD INSTALL $pkgname-$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership swirl "$pkgdir"/usr/lib/R/library
}
