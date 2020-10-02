# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=ugrep
pkgver=3.0.0
pkgrel=1
pkgdesc="Universal grep: ultra fast searcher of file systems, text and binary files, source code, archives, compressed files, documents, and more."
arch=(x86_64)
license=(BSD-3)
url="https://github.com/Genivia/ugrep"
depends=(bzip2 lz4 pcre2 xz zlib)
source=("https://github.com/Genivia/ugrep/archive/v${pkgver}.tar.gz")
sha256sums=('2206567cbf7177e7215f47e156e1baab9c93058f0c38152c52e9ae0198aa46c2')

build() {
    cd ${pkgname}-${pkgver}
    ./build.sh --prefix=${pkgdir}/usr/
}

package() {
    cd ${pkgname}-${pkgver}
    make install
    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
