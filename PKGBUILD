# Maintainer: Nick Skelsey <nskelsey@gmail.com>
pkgname=zeek
pkgver=3.0.6
pkgrel=1
pkgdesc="A network analysis framework"
arch=('x86_64')
url="https://zeek.org"
license=('BSD')
depends=("zlib" "libpcap" "bash" "libmaxminddb")
makedepends=("cmake" "swig" "bison" "flex" "python3" "openssl" "libpcap" "bash" "geoip" "zlib" "gperftools" "shadow")
source=("https://github.com/zeek/zeek/releases/download/v$pkgver/zeek-$pkgver.tar.gz")
sha256sums=("1858725fd6d04a1af3c2798c341529aa0d229e838b6476f036156dc5dd254aa1")


build() {
    cd "$srcdir/zeek-$pkgver"
    ./configure --prefix=/usr/ --binary-package --enable-static-binpac --disable-python --disable-zeekctl --disable-broker-tests
    make
}


package() {
    cd "$srcdir/zeek-$pkgver"
    make DESTDIR="$pkgdir/" install
}
