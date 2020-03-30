# Maintainer: Paolo Stivanin <info at paolostivanin dot com>
# Maintainer: Stephen Gregoratto <dev at sgregoratto dot me>
pkgname=libbaseencode
pkgver=1.0.9
pkgrel=3
pkgdesc='C library for encoding/decoding base32 and base64 data (RFC-4648)'
url="https://github.com/paolostivanin/libbaseencode"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('cmake')
options=('!strip')
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('a183d7cf30d931b2a078d6f0ef64616b71ab26f9258e5f4e191778c7ace7175d'
            'SKIP')

build()  {
    cd "$pkgname-$pkgver"
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
