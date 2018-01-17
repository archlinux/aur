# Maintainer: Bernardo Ferrari Mendonca <bernardo.mferrari@gmail.com>
pkgname=ophidian-lef-git
pkgver=5.8
pkgrel=2
groups=('ophidian')
pkgdesc="Cadence's LEF parser toolkit including C++ and C APIs"
arch=('x86_64')
url="https://gitlab.com/eclufsc/LEF"
license=('Apache')
options=(staticlibs)
makedepends=('make' 'bison' 'flex' 'zlib')
source=('git+https://gitlab.com/eclufsc/LEF.git#branch=master')
md5sums=('SKIP')


build() {
	cd $srcdir/LEF
	make CXXFLAGS="-fPIC" all
}

package() {
	cd $srcdir/LEF
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/lib
    install -d $pkgdir/usr/include
    install -d $pkgdir/usr/share/LEF
    install -D -m 644 $srcdir/LEF/bin/* $pkgdir/usr/bin
    install -D -m 644 $srcdir/LEF/lib/* $pkgdir/usr/lib
    install -D -m 644 $srcdir/LEF/include/* $pkgdir/usr/include

    install -D -m 644 $srcdir/LEF/LICENSE.TXT $pkgdir/usr/share/LEF/copyright
}

