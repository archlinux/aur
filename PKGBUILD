# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=boltztrap
pkgver=1.2.5
pkgrel=1
pkgdesc="Boltzmann Transport Properties (BoltzTraP) is a program for calculating the semi-classic transport coefficients"
arch=('any')
url="https://www.imc.tuwien.ac.at/forschungsbereich_theoretische_chemie/forschungsgruppen/prof_dr_gkh_madsen_theoretical_materials_chemistry/boltztrap/"
license=('GPL')
depends=('tcsh' 'gcc-fortran' 'lapack')
source=(BoltzTraP.tar.bz2::'https://owncloud.tuwien.ac.at/index.php/s/s2d55LYlZnioa3s/download')
sha256sums=('a550114eabec625cc7307e7f034e92e15e7ed9d0e1dbd92a7fd4f8f8e141d5fe')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make
}

package() {
  install -D -m755 "$srcdir/$pkgname-$pkgver/src/BoltzTraP" "$pkgdir/usr/bin/BoltzTraP"
  install -D -m755 "$srcdir/$pkgname-$pkgver/src/x_trans" "$pkgdir/usr/bin/x_trans"
}
