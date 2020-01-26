# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=xspin
pkgver=5.2.5
pkgrel=2
pkgdesc="Tcl/Tk GUI for spin"
arch=('any')
url="https://spinroot.com/spin/whatispin.html"
license=('custom')
depends=('spin' 'tk')
source=(https://spinroot.com/spin/Src/xspin525.tcl)

prepare() {
  sed -i 's~#!/bin/sh~#!/usr/bin/wish -f~' xspin525.tcl
}

package() {
  install -Dm0755 xspin525.tcl  $pkgdir/usr/bin/xspin
  install -Dm0644 /usr/share/licenses/spin/LICENSE.txt \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

md5sums=('4b41ff53c1834168aa183def9036bbb7')
sha256sums=('e23d8d562e39db6fe73570e52ee895cd806d15c3e52e638299cbc1eb61289eb6')
