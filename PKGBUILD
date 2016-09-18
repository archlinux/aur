#! /bin/bash
# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: cros_145<joner14@hotmail.com>

pkgname=bouml
pkgver=6.11.2
pkgrel=1
pkgdesc='A free UML 2 tool box allowing you to specify and generate code in C++, Java, Idl, Php and Python. '
arch=('i686' 'x86_64')
# options=('!strip')
url='http://bouml.fr/'
license=('GPL')
depends=('qt4')
# makedepends=('rpmextract')
source_x86_64=("https://github.com/funilrys/archlinux-bouml-src/archive/v$pkgver-64.tar.gz")
source_i686=("https://github.com/funilrys/archlinux-bouml-src/archive/v$pkgver-32.tar.gz")
sha512sums_x86_64=('993dfd73adcfcfb1d130dbf7703830d8533c3e28c4b7a0509a20ccd132f79d4cc05e5b19051b523ac979c6236ca77594cd113120d98e907cafaef2513c50c7a8')
sha512sums_i686=('0bce76915139f31dbd204d69b9ab2fe455df370c7b4aa2b4635e90cedcccda63613bc747c33c27d61fe9824357e47d2bd313b20ef1665f8d44bc65fef9328020')

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
