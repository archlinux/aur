# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=ugrep
pkgver=3.0.5
pkgrel=1
pkgdesc="Universal grep: ultra fast searcher of file systems, text and binary files, source code, archives, compressed files, documents, and more."
arch=(x86_64)
license=(BSD-3)
url="https://github.com/Genivia/ugrep"
depends=(bzip2 lz4 pcre2 xz zlib)
source=("https://github.com/Genivia/ugrep/archive/v${pkgver}.tar.gz")
sha256sums=('b541390fdacfa8f91664ebd3d8e27efb8efc0a1972ef377dc166fabe603485c7')

build() {
    cd ${pkgname}-${pkgver}
    ./build.sh --prefix=${pkgdir}/usr/ --enable-pretty
}

package() {
    cd ${pkgname}-${pkgver}
    make install
    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
