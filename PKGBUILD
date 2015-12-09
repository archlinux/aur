# Author: Javier Tia <javier dot tia at gmail dot com>

pkgname=cint
_pkgname=root
pkgver=5.34.34
pkgrel=1
pkgdesc='CINT is an interpreter for C and C++ code'
url='https://root.cern.ch/cint'
license='MIT'
depends=('readline' 'ncurses' 'termcap')
makedepends=('autoconf' 'automake' 'gcc')
source=("https://root.cern.ch/download/root_v${pkgver}.source.tar.gz")
sha256sums=('8c1faf893ed3b279f3500368b3dcd2087352020a69d3055c4d36726e7f6acd58')
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
