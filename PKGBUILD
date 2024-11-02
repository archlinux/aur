# Maintainer: Chris Baba <cbaba001@comcast.net>

# When updating versions change 'pkgver', 'pkgrel' (if needed), and 'sha256sums.

pkgname=chemcalc
pkgver=0.9.1
pkgrel=1
pkgdesc='A chemical calculator that calculates the amount of reagents to use when making solutions.'
arch=('x86_64')
url='https://github.com/Chris-Baba/ChemCalc'
license=('GPL-3.0-or-later')

depends=(
    'brotli' 
    'bzip2' 
    'curl' 
    'dbus' 
    'double-conversion' 
    'duktape' 
    'e2fsprogs' 
    'expat' 
    'fontconfig' 
    'freetype2' 
    'gcc-libs' 
    'glib2' 
    'glibc'
    'graphite' 
    'harfbuzz'
    'hicolor-icon-theme'
    'icu' 
    'keyutils' 
    'krb5' 
    'libb2' 
    'libcap'
    'libffi' 
    'libglvnd' 
    'libidn2' 
    'libnghttp2' 
    'libnghttp3' 
    'libpng'
    'libproxy' 
    'libpsl' 
    'libssh2' 
    'libunistring' 
    'libx11' 
    'libxau' 
    'libxcb'
    'libxdmcp' 
    'libxkbcommon' 
    'openssl' 
    'pcre2' 
    'qt6-base' 
    'systemd-libs'
    'util-linux-libs' 
    'zlib' 
    'zstd'
    )

makedepends=('cmake')

## Accepted naming method example:
## source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coder/program/archive/v${pkgver}.tar.gz")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Chris-Baba/ChemCalc/archive/refs/tags/v${pkgver}.tar.gz") 

sha256sums=('db535a1069ccaed50d6b0b965becc0357f44583ab235f7c77d7b37433b18b4c1')

options=(!debug)

build() {
    cmake \
        -B build \
        -S ChemCalc-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        #-Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build    
}
