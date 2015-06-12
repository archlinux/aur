# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=tcoffee
pkgver=11.00.8cbe486
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2')
pkgdesc="An alignment tool for Protein, DNA and RNA sequences"
url="http://www.tcoffee.org/Projects/tcoffee/"
depends=('gcc-libs' 'gcc-fortran')
source=("http://www.tcoffee.org/Packages/Stable/Latest/T-COFFEE_distribution_Version_$pkgver.tar.gz")
md5sums=('bd91485c06eda4f2ffcb61542d3ce302')

build() {
  cd "$srcdir/T-COFFEE_distribution_Version_$pkgver/t_coffee_source"
  make FCC=gfortran all
}

package() {
  cd "$srcdir/T-COFFEE_distribution_Version_$pkgver/t_coffee_source"
  install -Dm755 t_coffee "$pkgdir/usr/bin/t_coffee"
  install -Dm755 TMalign "$pkgdir/usr/bin/TMalign"
}

