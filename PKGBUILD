#!/bin/bash
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Nissar Chababy <funilrys@outlook.com>
# Contributor: Jorge Barroso <jorge.barroso.11@gmail.com>
# Contributor: cros_145<joner14@hotmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=bouml
pkgver=7.1.2
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
sha512sums_x86_64=('0889e3e3611c8fb5fb69360175ef3c9621eb6331365e4dcc0b47b0dc849b53063ee0fcb3c41e623a2eefcd13371062005fd763c553eb74aa986ad9e3504b89b6')
sha512sums_i686=('d01210a9c5eec73c868f2e12ec7e9e5e1162feac35d361df2a20d8e49312b81872c9cc1daa7617ed7f6004e11d9e32d4af9cb99b89e9333d3034fd68fa377bf0')

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
