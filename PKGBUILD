# Maintainer: Paolo Stivanin <info at paolostivanin dot com>
# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=libbaseencode
pkgver=1.0.12
pkgrel=1
pkgdesc='C library for encoding/decoding base32 and base64 data (RFC-4648)'
url="https://github.com/paolostivanin/libbaseencode"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('cmake')
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('ee9d4cc198d48365633274f41bd1b0eae12f9bef49182ea20050aa68f60e09b6'
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
