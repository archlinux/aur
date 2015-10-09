# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
pkgname=mkcue
_baseversion=1
_debianpkgrel=4
pkgver=${_baseversion}_${_debianpkgrel}
pkgrel=1
pkgdesc="generates a cue sheet from a cd"
arch=('i686' 'x86_64')
url="https://packages.debian.org/sid/mkcue"
license=('LGPL')
source=("http://httpredir.debian.org/debian/pool/main/m/mkcue/mkcue_${_baseversion}.orig.tar.gz"
        "http://httpredir.debian.org/debian/pool/main/m/mkcue/mkcue_${_baseversion}-${_debianpkgrel}.debian.tar.xz")
sha256sums=('2aaf57da4d0f2e24329d5e952e90ec182d4aa82e4b2e025283e42370f9494867'
            'e18517a15f2581e430a17de851e2db6066135a0d03711fc00a2ca33f57b56dae')

build() {
	cd "${pkgname}-${_baseversion}.orig"
	./configure --prefix=/usr
	make
	
}

package() {
	cd "${pkgname}-${_baseversion}.orig"
	install -D mkcue $pkgdir/usr/bin/mkcue
}
