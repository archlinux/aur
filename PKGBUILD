pkgname=raxml-light
_pkgname=RAxML-Light
pkgver=1.0.9
pkgrel=1
pkgdesc="A tool for computing terabyte phylogenies https://doi.org/10.1093/bioinformatics/bts309"
arch=('x86_64')
url="https://cme.h-its.org/exelixis/web/software/raxml-light/index.html"
depends=('gcc-libs')
makedepends=('make' 'gcc')
license=('unknow')
source=("https://cme.h-its.org/exelixis/php/countRAxMLLight${pkgver//./}.php")
md5sums=('a2740440b2d498a03bab88fbd6b7432a')

build() {
  cd "${_pkgname}-$pkgver"
  make -f Makefile.AVX.gcc
}

package() {
  cd "${_pkgname}-$pkgver"
  install -Dm 755 raxmlLight-AVX $pkgdir/usr/bin/$pkgname
}

