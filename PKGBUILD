#!/bin/bash
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Nissar Chababy <funilrys@outlook.com>
# Contributor: Jorge Barroso <jorge.barroso.11@gmail.com>
# Contributor: cros_145<joner14@hotmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=bouml
pkgver=7.3
pkgrel=1
pkgdesc='A free UML 2 tool box including a modeler allowing you to specify and generate code in C++, Java, IDL, PHP, Python and MySQL'
arch=('i686' 'x86_64')
url='http://bouml.fr/'
license=('GPL')
depends=('qt4')
source_x86_64=("v${pkgver}-64.tar.gz::http://www.bouml.fr/files/$pkgname-$pkgver-CentOS7.x86_64.rpm")
source_i686=("v${pkgver}-32.tar.gz::http://www.bouml.fr/files/$pkgname-$pkgver-CentOS6.i686.rpm")
sha512sums_x86_64=('1231e9b713ac6a1e8063b2e74d1f6f6a1d7900e3cb0ea7fbc4363ab5f4e77f814802a84485700d1df65904730664ba29f472ffb023010f094e2b25a2f53c1c02')
sha512sums_i686=('c98a5eb5161caf80e42aa27206f16c7d663c946889103f78f6141616c5d59b5c51835c376ab51e5fafa9e6df345dee7d48fef032f7fb92290cda1efd4debd8ac')

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
