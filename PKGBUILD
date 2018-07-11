# $Id$
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Yamashita Ren <lemaitre.lotus@gmail.com>

pkgname=dcadec
pkgver=0.2.0
pkgrel=1
pkgdesc='DTS Coherent Acoustics decoder with support for HD extensions'
arch=('x86_64')
url='https://github.com/foo86/dcadec.git'
license=('LGPL2.1')
depends=('glibc')
provides=('libdcadec.so')
source=("dcadec-${pkgver}.tar.gz::https://github.com/foo86/dcadec/archive/v${pkgver}.tar.gz")
sha256sums=('ed9d207fde3e8d576f3af8b0d1235b3371e315175757173689104efcaebf0d44')

build() {
  cd dcadec-${pkgver}

  export CONFIG_SHARED='TRUE'

  make
}

package() {
  cd dcadec-${pkgver}

  export CONFIG_SHARED='TRUE'
  export PREFIX='/usr'

  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/bin/dcadec{,-hd}
}

# vim: ts=2 sw=2 et:
