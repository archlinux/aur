#!/bin/bash
# Maintainer: Stick <stick@stma.is>
# Contributor: Nissar Chababy <funilrys@outlook.com>
# Contributor: Jorge Barroso <jorge.barroso.11@gmail.com>
# Contributor: cros_145<joner14@hotmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=bouml
pkgver=7.10.0
pkgrel=1
pkgdesc='A free UML 2 tool box including a modeler allowing you to specify and generate code in C++, Java, IDL, PHP, Python, and MySQL'
arch=('i686' 'x86_64')
url='https://bouml.fr/'
license=('GPL')
depends=('qt4')
source_x86_64=("v${pkgver}-64.tar.gz::https://www.bouml.fr/files/$pkgname-$pkgver-CentOS7.x86_64.rpm")
source_i686=("v${pkgver}-32.tar.gz::https://www.bouml.fr/files/$pkgname-$pkgver-CentOS6.i686.rpm")
sha256sums_x86_64=('bd399da33c5b5259e0b1880046c715e52d807a8ae07b0abc5737a5a023806eaa')
sha256sums_i686=('80003198c85b62947bf253e08499ca1f15e8c4963a4ff3ef155ea2068d8016d6')

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
