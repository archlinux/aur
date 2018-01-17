# Maintainer: Bernardo Ferrari Mendonca <bernardo.mferrari@gmail.com>
pkgname=ophidian-def-git
pkgver=5.8
pkgrel=2
groups=('ophidian')
pkgdesc="Cadence's DEF parser toolkit including C++ and C APIs"
arch=('x86_64')
url="https://gitlab.com/eclufsc/DEF"
license=('Apache')
options=(staticlibs)
makedepends=('make' 'bison' 'flex' 'zlib')
source=('git+https://gitlab.com/eclufsc/DEF.git#branch=master')
md5sums=('SKIP')

build() {
	cd $srcdir/DEF
	make CXXFLAGS="-fPIC" all
}

package() {
	cd $srcdir/DEF
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/lib
    install -d $pkgdir/usr/include
    install -d $pkgdir/usr/share/DEF
    install -D -m 644 $srcdir/DEF/bin/def* $pkgdir/usr/bin
    install -D -m 644 $srcdir/DEF/lib/* $pkgdir/usr/lib
    install -D -m 644 $srcdir/DEF/include/* $pkgdir/usr/include

    install -D -m 644 $srcdir/DEF/LICENSE.TXT $pkgdir/usr/share/DEF/copyright
}
