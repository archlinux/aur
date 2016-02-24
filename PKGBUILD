# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=darwin
pkgver=1.4.5
pkgrel=2

pkgdesc="The darwin prover suite. http://combination.cs.uiowa.edu/Darwin/"

url="http://combination.cs.uiowa.edu/Darwin/"
arch=('x86_64')
license=('GPL2')
depends=('ocaml' 'python')
provides=('darwin')
conflicts=('darwin')
sha1sums=('25edfc2ffb8af176387c6d8046ed447e4ae5a6b7')
source=("http://combination.cs.uiowa.edu/Darwin/files/darwin_v${pkgver}.tar.gz")
package() {
  export MAKEFLAGS='-j1'
  cd "${srcdir}/darwin_v${pkgver}"

  python2 ./configure.py

  sed -i 's/ -w $(WARNING_FLAGS) -warn-error A//g' Makefile

  make

  mkdir -p ${pkgdir}/usr/bin

  cp darwin ${pkgdir}/usr/bin/darwin
}
# vim:syntax=sh
