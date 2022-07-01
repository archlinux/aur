# Maintainer: Sushil Khatri <esinkei at protonmail dot com>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
pkgname=quantum-espresso
pkgver=7.1
pkgrel=1
pkgdesc="A suite of codes for electronic-structure calculations and modeling"
arch=("x86_64")
url="https://www.quantum-espresso.org/"
license=('GPL2')
depends=('openmpi' 'gcc-fortran' 'fftw' 'elpa' 'libxc')
makedepends=('gcc-fortran')
checkdepends=('python')
source=("https://gitlab.com/QEF/q-e/-/archive/qe-${pkgver}/q-e-qe-${pkgver}.tar.gz")
sha256sums=('d56dea096635808843bd5a9be2dee3d1f60407c01dbeeda03f8256a3bcfc4eb6')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure 
  make all 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
