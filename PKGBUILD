# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=tcoffee
pkgver=12.00.7fb08c2
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2')
pkgdesc="An alignment tool for Protein, DNA and RNA sequences"
url="http://www.tcoffee.org"
makedepends=('gcc-fortran')
depends=('gcc-libs')
source=("$url/Packages/Stable/Version_$pkgver/T-COFFEE_distribution_Version_$pkgver.tar.gz")
sha256sums=('6119514a0e36da4b4de88741b8c12f9c8ab653772b3952a011d4cb373beee44f')

build() {
  cd "$srcdir/T-COFFEE_distribution_Version_$pkgver/t_coffee_source"
  make CC="g++ -fpermissive" FCC=gfortran all
}

package() {
  cd "$srcdir/T-COFFEE_distribution_Version_$pkgver/t_coffee_source"
  install -Dm755 t_coffee "$pkgdir/usr/bin/t_coffee"
  install -Dm755 TMalign "$pkgdir/usr/bin/TMalign"
}

