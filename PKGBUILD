# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=nqc
pkgver=3.1.r6
pkgrel=1
pkgdesc="Not Quite C is a simple language with a C-like syntax that can be used to program Lego's RCX programmable brick (from the Mindstorms set)."
arch=('i686' 'x86_64')
url='http://bricxcc.sourceforge.net/nqc/'
license=('custom:MPL')
dependends=('gcc' 'glibc')
source=('http://bricxcc.sourceforge.net/nqc/release/nqc-3.1.r6.tgz')
md5sums=('2ed4b2728ab6f0d21723a466996ce91b')

build() {

	rm -f compiler/parse.cpp compiler/parse.tab.h
	rm -f compiler/lexer.cpp
	rm -f bin/*
	rm -f */*.o
	rm -f compiler/rcx1_nqh.h compiler/rcx2_nqh.h
	rm -f rcxlib/rcxnub.h
	make

}

package() {
	mkdir -p ${pkgdir}/usr/bin/
	cp -r bin/* ${pkgdir}/usr/bin/
}

