# Maintainer: LoaD Accumulator <lda@freetards.xyz>
pkgname=cytoplasm-git
pkgver=0.4.0
pkgrel=1
pkgdesc="The Telodendria core library"
arch=('i686' 'x86_64' 'aarch64')
url="https://git.telodendria.io/Telodendria/Cytoplasm"
license=('Telodendria')
depends=('openssl')
makedepends=('git' 'gcc' 'sudo' 'make')
provides=('cytoplasm')
source=($pkgname::git+https://git.telodendria.io/Telodendria/Cytoplasm.git)
md5sums=()
validpgpkeys=()
md5sums=("SKIP")

prepare() {
        cd "$pkgname"
}

build() {
        cd "$pkgname"
        # By default, it uses the c99 compiler instead of cc?????
        export CC=cc
        ./configure --prefix=/usr --no-static
        export LD_LIBRARY_PATH="$PWD/out/lib"
        make
}

package() {
        cd "$pkgname"
        sudo make DESTDIR="$pkgdir/" install
}
