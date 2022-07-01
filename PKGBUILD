# Maintainer: Sushil Khatri <esinkei @ tuta dot io>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
pkgname=quantum-espresso
pkgver=7.1
pkgrel=1
pkgdesc="A suite of codes for electronic-structure calculations and modeling"
arch=("x86_64")
url="https://www.quantum-espresso.org/"
license=('GPL2')
depends=('openmpi')
makedepends=('gcc-fortran')
checkdepends=('python')
source=("https://gitlab.com/QEF/q-e/-/archive/qe-${pkgver}/q-e-qe-${pkgver}.tar.gz")
sha256sums=('SKIP')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure 
  make all 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
