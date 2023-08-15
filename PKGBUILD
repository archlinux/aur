# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=tcoffee
pkgver=13.46.0.919e8c6b
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2')
pkgdesc="An alignment tool for Protein, DNA and RNA sequences"
url="http://www.tcoffee.org"
makedepends=('gcc-fortran')
depends=('gcc-libs')
source=($pkgname-$pkgver.tar.gz::https://github.com/cbcrg/tcoffee/archive/refs/tags/Version_$pkgver.tar.gz)
sha256sums=('e134f5c075eaa95dd6bc2b4da01696150ea78185d34399d465709bd9cf743d08')

build() {
  cd tcoffee-Version_$pkgver/t_coffee/src
  make CC="g++ -fpermissive" FCC=gfortran all
}

package() {
  cd tcoffee-Version_$pkgver/t_coffee/src
  install -Dm755 t_coffee "$pkgdir/usr/bin/t_coffee"
}
