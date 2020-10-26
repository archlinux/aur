# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=ugrep
pkgver=3.0.4
pkgrel=1
pkgdesc="Universal grep: ultra fast searcher of file systems, text and binary files, source code, archives, compressed files, documents, and more."
arch=(x86_64)
license=(BSD-3)
url="https://github.com/Genivia/ugrep"
depends=(bzip2 lz4 pcre2 xz zlib)
source=("https://github.com/Genivia/ugrep/archive/v${pkgver}.tar.gz")
sha256sums=('807f722cabe6832910b1cdc5f52e66079dafb9992481095c08ed8abae672e6a2')

build() {
    cd ${pkgname}-${pkgver}
    ./build.sh --prefix=${pkgdir}/usr/ --enable-pretty
}

package() {
    cd ${pkgname}-${pkgver}
    make install
    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
