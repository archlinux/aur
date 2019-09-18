# Maintainer: Jaco Malan <jacomalan.12@gmail.com>
pkgname=libclstl
pkgver=0.1.2
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/Code-Log/clstl"
license=('MIT')
depends=('clang')

prepare() {

    git clone https://github.com/Code-Log/clstl $srcdir
    mkdir -p $srcdir/build

}

build() {

    cd $srcdir/build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=$(which clang) -DCMAKE_CXX_COMPILER=$(which clang++)
    make $MAKEFLAGS

}

package() {

    cd $srcdir/build
    make DESTDIR="$pkgdir" install

}
