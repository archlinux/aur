# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=spass
pkgver=3.7
pkgrel=3
pkgdesc="An Automated Theorem Prover for First-Order Logic with Equality."
url="http://www.spass-prover.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl')
makedepends=('')
source=('http://www.spass-prover.org/download/sources/spass37.tgz')
sha512sums=('5b4efd7b767dfee3f24e7917a6ec58ac240ab33bf601722eabd50af57637d8fdd62de9e34e7cd1cd98b8b7e371c9e2d47c8fa3e07c6e7ce2fa616a76646a4e12')

build() {
  cd ${srcdir}/SPASS-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/SPASS-${pkgver}
  make DESTDIR=${pkgdir} install
}
# vim:syntax=sh
