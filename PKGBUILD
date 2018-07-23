#!/bin/bash
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Nissar Chababy <funilrys@outlook.com>
# Contributor: Jorge Barroso <jorge.barroso.11@gmail.com>
# Contributor: cros_145<joner14@hotmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=bouml
pkgver=7.7
pkgrel=1
pkgdesc='A free UML 2 tool box including a modeler allowing you to specify and generate code in C++, Java, IDL, PHP, Python and MySQL'
arch=('i686' 'x86_64')
url='http://bouml.fr/'
license=('GPL')
depends=('qt4')
source_x86_64=("v${pkgver}-64.tar.gz::http://www.bouml.fr/files/$pkgname-$pkgver-CentOS7.x86_64.rpm")
source_i686=("v${pkgver}-32.tar.gz::http://www.bouml.fr/files/$pkgname-$pkgver-CentOS6.i686.rpm")
sha256sums_x86_64=('fa13524ab7a3f958ab729697e02085d36f7c82fbc47f92ce9e94f83f53bf06c2')
sha256sums_i686=('3504eaac7865e9b4cf660f8266f16298638162306db41725eb152437a45dae36')

package() {
    mkdir -p "$pkgdir"/usr/bin/
    mkdir -p "$pkgdir"/usr/share/applications/
    mkdir -p "$pkgdir"/usr/share/icons
    cp -R "$srcdir"/usr/bin/* "$pkgdir"/usr/bin/
    cp -R "$srcdir"/usr/share/applications/* "$pkgdir"/usr/share/applications/
    cp -R "$srcdir"/usr/share/icons/* "$pkgdir"/usr/share/icons/
    mkdir -p "$pkgdir"/usr/lib/bouml
    if [ "$CARCH" = "x86_64" ]; then
        cp -R "$srcdir"/usr/lib64/bouml/* "$pkgdir"/usr/lib/bouml/
    else
        cp -R "$srcdir"/usr/lib/bouml/* "$pkgdir"/usr/lib/bouml/
    fi
}
