# Maintainer: Bernardo Ferrari Mendonca <bernardo.mferrari@gmail.com>
pkgname=ophidian-git
pkgver=0.2.1
pkgrel=1
groups=('ophidian')
pkgdesc="Open-Source Library for Physical Design Research and Teaching."
arch=('any')
url="https://gitlab.com/eclufsc/ophidian"
license=('Apache')
options=(staticlibs)
makedepends=('cmake' 'make' 'boost>=1.65' 'coin-or-lemon' 'ophidian-lef-git' 'ophidian-def-git' 'ophidian-flute-git' 'ophidian-verilog-parser-git' 'ophidian-units-git')
depends=('boost>=1.65' 'coin-or-lemon' 'ophidian-lef-git' 'ophidian-def-git' 'ophidian-flute-git' 'ophidian-verilog-parser-git' 'ophidian-units-git')
source=('git+https://gitlab.com/eclufsc/ophidian.git#branch=build_system')
md5sums=('SKIP')

build() {
	cd $srcdir/ophidian
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

check() {
    cd $srcdir/ophidian/build/test
    ./ophidian_tests
}

package() {
	cd $srcdir/ophidian/build
	make DESTDIR="$pkgdir/" install
}
