#!/bin/bash
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Nissar Chababy <funilrys@outlook.com>
# Contributor: Jorge Barroso <jorge.barroso.11@gmail.com>
# Contributor: cros_145<joner14@hotmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=bouml
pkgver=7.4
pkgrel=1
pkgdesc='A free UML 2 tool box including a modeler allowing you to specify and generate code in C++, Java, IDL, PHP, Python and MySQL'
arch=('i686' 'x86_64')
url='http://bouml.fr/'
license=('GPL')
depends=('qt4')
source_x86_64=("v${pkgver}-64.tar.gz::http://www.bouml.fr/files/$pkgname-$pkgver-CentOS7.x86_64.rpm")
source_i686=("v${pkgver}-32.tar.gz::http://www.bouml.fr/files/$pkgname-$pkgver-CentOS6.i686.rpm")
sha256sums_x86_64=('d7204d10e343eb74c253681d7003500c6709925c08dd47b88f099543a8d70528')
sha256sums_i686=('4c998247c1acd7c3bc35a6a4cc10c024ae59fd62b89195ca80450195bcb6e625')

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
