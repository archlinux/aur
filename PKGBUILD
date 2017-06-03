# Maintainer: Paolo Stivanin <info [at] paolostivanin [DOT] com>

pkgname=libbaseencode
pkgver=1.0.3
pkgrel=1
pkgdesc='Library written in C for encoding and decoding data using base32 or base64 (RFC-4648)'
arch=('i686' 'x86_64')
makedepends=('cmake')
url="https://github.com/paolostivanin/libbaseencode"
options=('!strip')
license=('GPL3')

source=("https://github.com/paolostivanin/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=("8e3ac719c76a4f5aa2e1e93b194a596bf14370ad1ae2865b7c2972b60c7a53cf")

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
