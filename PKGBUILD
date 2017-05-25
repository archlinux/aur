# Maintainer: Paolo Stivanin <info [at] paolostivanin [DOT] com>

pkgname=libbaseencode
pkgver=1.0.2
pkgrel=1
pkgdesc='Library written in C for encoding and decoding data using base32 or base64 (RFC-4648)'
arch=('i686' 'x86_64')
makedepends=('cmake')
url="https://github.com/paolostivanin/libbaseencode"
options=('!strip')
license=('GPL3')

source=("https://github.com/paolostivanin/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=("ef96b63bfe560b0f556c50a887a252f97d0941dcfaa6a99d0c53105205114e01")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir build && cd $_
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="$pkgdir" install
}
