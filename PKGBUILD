# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=ugrep
pkgver=1.8.1
pkgrel=1
pkgdesc="Universal grep: ultra fast searcher of file systems, text and binary files, source code, archives, compressed files, documents, and more."
arch=(x86_64)
license=(BSD-3)
url="https://github.com/Genivia/ugrep"
optdepends=('pcre2: Perl regular expressions support (preferred)'
            'boost-libs: Perl regular expressions support'
            'zlib: decompress support'
            'bzip2: bzip file support'
            'xz: lzma support')
source=("https://github.com/Genivia/ugrep/archive/v${pkgver}.tar.gz")
sha256sums=('4ae24ef866bfbe39f5d6c3da4ca664413d773fd77283bc3ee96530e969053742')

build() {
    cd ${pkgname}-${pkgver}
    ./build.sh --prefix=${pkgdir}/usr/
}

package() {
    cd ${pkgname}-${pkgver}
    make install
}
