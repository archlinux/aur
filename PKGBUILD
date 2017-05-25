# Maintainer: Paolo Stivanin <info [at] paolostivanin [DOT] com>

pkgname=libbaseencode
pkgver=1.0.2
pkgrel=2
pkgdesc='Library written in C for encoding and decoding data using base32 or base64 (RFC-4648)'
arch=('i686' 'x86_64')
makedepends=('cmake')
url="https://github.com/paolostivanin/libbaseencode"
options=('!strip')
license=('GPL3')

source=("https://github.com/paolostivanin/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=("b21d933e8eb863e0b2555310e0d822b9d4c059fb09b085779877e53db931ea03")

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
