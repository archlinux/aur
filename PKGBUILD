#! /bin/bash
# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: cros_145<joner14@hotmail.com>

pkgname=bouml
pkgver=6.11.3
pkgrel=1
pkgdesc='A free UML 2 tool box allowing you to specify and generate code in C++, Java, Idl, Php and Python. '
arch=('i686' 'x86_64')
options=('!strip')
url='http://bouml.fr/'
license=('GPL')
depends=('qt4')
# makedepends=('rpmextract')
source_x86_64=("v${pkgver}-64.tar.gz::https://github.com/funilrys/archlinux-bouml-src/archive/v$pkgver-64.tar.gz")
source_i686=("v${pkgver}-32.tar.gz::https://github.com/funilrys/archlinux-bouml-src/archive/v$pkgver-32.tar.gz")
sha512sums_x86_64=('e4e66d7c472cbc037514cfaa189cf6909317a5ddc02d8c2899a6b1465925abe44a0225e6bf97f2e5b8a09bf35433b9281ed5208767e7648ddef1921cf5fd4dc8')
sha512sums_i686=('d90a57e02fab8e25b77b3f75b95f70846f482731108e384f45ec4cf6e93cdcc526afdf1297c37dec70900cad57b578a6ed6ec9ebde0cb5ce11e7eb52baca3060')

package() {
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/applications/
    mkdir -p $pkgdir/usr/share/icons
    if [ "$CARCH" = "x86_64" ]; then
        mkdir -p $pkgdir/usr/lib64
        cp -R $srcdir/archlinux-bouml-src-$pkgver-64/usr/bin/* $pkgdir/usr/bin/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-64/usr/share/applications/* $pkgdir/usr/share/applications/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-64/usr/share/icons/* $pkgdir/usr/share/icons/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-64/usr/lib64/* $pkgdir/usr/lib64/
    else
        mkdir -p $pkgdir/usr/lib
        cp -R $srcdir/archlinux-bouml-src-$pkgver-32/usr/bin/* $pkgdir/usr/bin/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-32/usr/share/applications/* $pkgdir/usr/share/applications/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-32/usr/share/icons/* $pkgdir/usr/share/icons/
        cp -R $srcdir/archlinux-bouml-src-$pkgver-32/usr/lib/* $pkgdir/usr/lib/
    fi
}
