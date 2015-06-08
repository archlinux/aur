# Maintainer: dobo <dobo90_at_gmail.com>

pkgname=igcc
pkgver=0.2
pkgrel=1
pkgdesc='Interactive GCC. Real-eval-print loop for C/C++ programmers.'
arch=(any)
url='http://www.artificialworlds.net/wiki/IGCC/IGCC'
license=(GPL)
depends=(python2)
source=(http://downloads.sourceforge.net/sourceforge/igcc/igcc-${pkgver}.tar.bz2)
md5sums=(e3fb5a491e02e524059e357903487785)

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # python2 fix
  sed -i 's@#!/usr/bin/python@#!/usr/bin/python2@' igcc

  lib_path=$(echo /usr/lib/python2.?) # is this really right way?

  # creating directory
  install -d -m 755 ${pkgdir}/${lib_path}/libigcc

  # copying files
  install -D -m 644 libigcc/* ${pkgdir}/${lib_path}/libigcc
  install -D -m 755 igcc ${pkgdir}/usr/bin/igcc
}

