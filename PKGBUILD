# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=qdecoder
pkgver=12.0.5
pkgrel=1
pkgdesc="qDecoder is a CGI library for C/C++ programming language which has been developed since 1996."
arch=('x86_64' 'i686')
url="https://wolkykim.github.io/qdecoder/"
license=('CUSTOM')
depends=()
makedepends=('fcgi')
source=("https://github.com/wolkykim/qdecoder/archive/r${pkgver}.tar.gz")
sha256sums=('641d3df4895626d7a530c5d26724e9b5887e9845d4b47f42c1cbce4a17ebf6af')

prepare() {
    cd "${srcdir}/${pkgname}-r${pkgver}"
    ./configure --enable-fastcgi=/usr/include --prefix="${pkgdir}/usr"
}

build() {
    cd "${srcdir}/${pkgname}-r${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-r${pkgver}"
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}" "$pkgdir/usr/include" "$pkgdir/usr/lib"
    make install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}
