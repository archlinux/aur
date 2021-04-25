# Maintainer: Mort Yao <soi@mort.ninja>
# Submitter: Max de Bayser <maxdebayser@gmail.com>
pkgname=prover9
pkgver=2009.11A
pkgrel=3
pkgdesc="Prover9 is an automated theorem prover for first-order and equational logic"
arch=('i686' 'x86_64')
url="http://www.cs.unm.edu/~mccune/prover9/"
license=('GPL')
makedepends=('gcc' 'make')
provides=('mace4' 'ladr')
source=(http://www.cs.unm.edu/~mccune/prover9/download/LADR-${pkgver/./-}.tar.gz)
md5sums=('ab409f31ecbb4410b1c7d75deadea2c6')

build() {
  cd "$srcdir/LADR-${pkgver/./-}"

  make all -j1
}

package() {
  cd "$srcdir/LADR-${pkgver/./-}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/share/man/man1"

  install bin/* "${pkgdir}/usr/bin"
  install "ladr/libladr.a" "${pkgdir}/usr/lib"
  install "mace4.src/libmace4.a" "${pkgdir}/usr/lib"
  install manpages/* "${pkgdir}/usr/share/man/man1"
}
