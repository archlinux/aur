# Maintainer: Nick Skelsey <nskelsey+zz@gmail.com>
pkgname=zeek
pkgver=2.6.2
pkgrel=2
pkgdesc="A network analysis framework"
arch=('x86_64')
url="https://www.zeek.org/index.html"
license=('BSD')
depends=("zlib" "libpcap" "bash" "libmaxminddb")
makedepends=("cmake")
source=("git+https://github.com/zeek/zeek")
md5sums=("SKIP")


build() {
    cd "$srcdir/zeek"
    git submodule update --init --recursive
    ./configure --disable-auxtools --disable-perftools --disable-python --disable-broker-tests
    make
}

package() {
    cd "$srcdir/zeek"
    make DESTDIR="$pkgdir/" install
}
