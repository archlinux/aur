#!/bin/bash
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Nissar Chababy <funilrys@outlook.com>
# Contributor: Jorge Barroso <jorge.barroso.11@gmail.com>
# Contributor: cros_145<joner14@hotmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=bouml
pkgver=7.1
pkgrel=1
pkgdesc='A free UML 2 tool box including a modeler allowing you to specify and generate code in C++, Java, IDL, PHP, Python and MySQL'
arch=('i686' 'x86_64')
# options=('!strip')
url='http://bouml.fr/'
license=('GPL')
depends=('qt4')
# makedepends=('rpmextract')
source_x86_64=("v${pkgver}-64.tar.gz::http://www.bouml.fr/files/$pkgname-$pkgver-CentOS7.x86_64.rpm")
source_i686=("v${pkgver}-32.tar.gz::http://www.bouml.fr/files/$pkgname-$pkgver-CentOS6.i686.rpm")
sha512sums_x86_64=('5643dbe95a1c0a0b768751d8d0c757c2f83518c963777d9c8b9bde79d96ee5228d7c489f5332d1f7f3e4614213b3adc8b50df58646325757038b5b1979d33d9b')
sha512sums_i686=('6f3d018808fce3a6690c8e8a8a6bb2bc8b3bfc599d6acffdbc656bc391abd6a1761df0b60ded85224e0ae88a71982165afe88b6d7140173c922672d30218a9e3')

package() {
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/applications/
    mkdir -p $pkgdir/usr/share/icons
    cp -R $srcdir/usr/bin/* $pkgdir/usr/bin/
    cp -R $srcdir/usr/share/applications/* $pkgdir/usr/share/applications/
    cp -R $srcdir/usr/share/icons/* $pkgdir/usr/share/icons/
    mkdir -p $pkgdir/usr/lib/bouml
    if [ "$CARCH" = "x86_64" ]; then
        cp -R $srcdir/usr/lib64/bouml/* $pkgdir/usr/lib/bouml/
    else
        cp -R $srcdir/usr/lib/bouml/* $pkgdir/usr/lib/bouml/
    fi
}
