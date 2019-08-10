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
pkgver=13.39.0.d675aed
source=("$url/Packages/Stable/Latest/T-COFFEE_distribution_Version_$pkgver.tar.gz")
sha256sums=('33e0eb17fe5a88e59ddeaad2e54782e3ab5b2f70d8654e54aff1ccc4e5cc127f')

build() {
  cd "$srcdir/T-COFFEE_distribution_Version_$pkgver/t_coffee_source"
  make CC="g++ -fpermissive" FCC=gfortran all
}

package() {
  cd "$srcdir/T-COFFEE_distribution_Version_$pkgver/t_coffee_source"
  install -Dm755 t_coffee "$pkgdir/usr/bin/t_coffee"
  install -Dm755 TMalign "$pkgdir/usr/bin/TMalign"
}

