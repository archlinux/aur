# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=r-swirl
pkgver=2.4.4
pkgrel=1
pkgdesc='Platform for learning (and teaching) statistics and R simultaneously and interactively'
arch=('any')
url='https://github.com/swirldev/swirl'
license=('GPL')
depends=('r' 'r-digest' 'r-httr' 'r-rcurl' 'r-stringr' 'r-yaml')
makedepends=('r-testthat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d9a7209f287a85d8780d41438f2d761eda6e97dde77a24d89e07ec8509e42d4ab76809c067c82f907a0f2d630404d384020f674fb5ae4bf5baa856c59e9fc43d')

build(){
    R CMD INSTALL $pkgname-$pkgver.tar.gz -l "$srcdir"
}

#check(){
#    R CMD BATCH tests/test-all.R
#}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership swirl "$pkgdir"/usr/lib/R/library
}
