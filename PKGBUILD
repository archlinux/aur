# Author: Javier Tiá <javier dot tia at gmail dot com>

pkgname=cint
_pkgname=root
pkgver=5.34.38
pkgrel=1
pkgdesc='CINT is an interpreter for C and C++ code'
url='https://root.cern.ch/cint'
license=('MIT')
depends=('readline' 'ncurses' 'termcap')
makedepends=('autoconf' 'automake' 'gcc')
source=("https://root.cern.ch/download/root_v${pkgver}.source.tar.gz")
sha256sums=('2c3bda69601d94836bdd88283a6585b4774eafc813deb6aa348df0af2922c4d2')
arch=('i686' 'x86_64')

build() {
  cd ${srcdir}/${_pkgname}/${pkgname}

  ./configure
  make || return 1
}

package() {
  cd ${srcdir}/${_pkgname}

  install -m0755 -D ${srcdir}/${_pkgname}/${pkgname}/bin/${pkgname} \
                   ${pkgdir}/usr/bin/${pkgname}
  install -m0755 -D ${srcdir}/${_pkgname}/${pkgname}/lib/libCint.so \
                   ${pkgdir}/usr/lib/libCint.so
}

# vim:set ts=2 sw=2 ft=sh et:
