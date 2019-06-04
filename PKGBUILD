# Maintainer: Nick Skelsey <nskelsey+zz@gmail.com>
pkgname=zeek
pkgver=2.6.2
pkgrel=1
pkgdesc="A network analysis framework"
arch=('x86_64')
url="https://www.zeek.org/index.html"
license=('BSD')
source=("https://www.zeek.org/downloads/bro-2.6.2.tar.gz")
sha256sums=("6df6876f3f7b1dd8afeb3d5f88bfb9269f52d5d796258c4414bdd91aa2eac0a6")


build() {
    bro_ver=bro-2.6.2
    tar xf $bro_ver.tar.gz
    cd "$bro_ver"
    ./configure --disable-broctl --disable-auxtools --disable-perftools --disable-python --disable-broker-tests
    make -j7
}

package() {
    bro_ver=bro-2.6.2
    cd "$bro_ver"
    make DESTDIR="$pkgdir/" install
}
