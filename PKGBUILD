# Maintainer: Nick Skelsey <nskelsey@gmail.com>
pkgname=zeek
pkgver=3.1.3
pkgrel=1
pkgdesc="A network analysis framework"
arch=('x86_64')
url="https://zeek.org"
license=('BSD')
depends=("zlib" "libpcap" "bash" "libmaxminddb")
makedepends=("cmake" "swig" "bison" "flex" "python3" "openssl" "libpcap" "bash" "geoip" "zlib" "gperftools" "shadow")
source=("https://github.com/zeek/zeek/releases/download/v3.1.3/zeek-3.1.3.tar.gz")
sha256sums=("d7bf24615c4c0af2435c99c9fb8c9c0f0ecdce375e184ba7f63b715ae5900a61")


build() {
    cd "$srcdir/zeek-$pkgver"
    ./configure --prefix=/usr/ --binary-package --enable-static-binpac --disable-python --disable-zeekctl --disable-broker-tests --libdir=/usr/lib/zeek
    make
}


package() {
    cd "$srcdir/zeek-$pkgver"
    make DESTDIR="$pkgdir/" install
}
