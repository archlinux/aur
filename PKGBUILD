# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=tcoffee
pkgver=13.45.0.4846264
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2')
pkgdesc="An alignment tool for Protein, DNA and RNA sequences"
url="http://www.tcoffee.org"
makedepends=('gcc-fortran')
depends=('gcc-libs')
source=("$url/Packages/Stable/Latest/T-COFFEE_distribution_Version_$pkgver.tar.gz")
sha256sums=('c8e5ba17de11ddf07cf2ed37f077d81c1432d55b77761f115f9374de6f8d0d03')

build() {
  cd "$srcdir/T-COFFEE_distribution_Version_$pkgver/t_coffee_source"
  make CC="g++ -fpermissive" FCC=gfortran all
}

package() {
  cd "$srcdir/T-COFFEE_distribution_Version_$pkgver/t_coffee_source"
  install -Dm755 t_coffee "$pkgdir/usr/bin/t_coffee"
  install -Dm755 TMalign "$pkgdir/usr/bin/TMalign"
}

