pkgname=exabayes
pkgver=1.5.1
pkgrel=2
pkgdesc="software package for Bayesian tree inference https://doi.org/10.1093/molbev/msu236"
arch=('x86_64')
url="https://cme.h-its.org/exelixis/web/software/exabayes/"
depends=('gcc-libs')
makedepends=('make' 'gcc' 'autoconf' 'autoconf-archive')
license=('GPL')
source=("https://cme.h-its.org/exelixis/resource/download/software/exabayes-${pkgver}.tar.gz")
md5sums=('d7382116cd38cd094a8484f05f7fdcf6')

build() {
  cd "${pkgname}-$pkgver"
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-$pkgver"
  make DESTDIR=$pkgdir install
}

