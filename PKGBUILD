#!/bin/bash

# Maintainer: Gustavo Ramos Rehermann <rehermann6046@gmail.com>
# Contributor: Hao Zhang <hzhangxyz@outlook.com>

pkgname=cling-bin
_pkgname=cling
pkgver='2020.11.05'
epoch=1
file_name="cling_$(tr '.' '-'<<<$pkgver)_ROOT-ubuntu2004"
pkgrel=2
pkgdesc="The cling C++ interpreter"
arch=(x86_64)
url="https://root.cern.ch/cling"
license=('Cling Release License')

source=(
  "https://root.cern/download/cling/$file_name.tar.bz2"
)
sha256sums=(
  '73eb884f866e3d1511c647bc07ba215ab2af5cf2e3a8c9c93e39be9c4bb2eb4e'
)

prepare() {
   tar xvf $file_name.tar.bz2
}

package() {
   install -d "$pkgdir/opt" "$pkgdir/usr/bin"
   mv "$srcdir/$file_name" "$pkgdir/opt/$_pkgname"
   ln -s "/opt/$_pkgname/bin/cling" "$pkgdir/usr/bin"
}
