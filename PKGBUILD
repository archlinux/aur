# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=tt-logger
pkgver=1.1.7
pkgrel=1
pkgdesc="A flexible and performant C++ logging library for Tenstorrent projects"
arch=('x86_64')
url="https://github.com/tenstorrent/tt-logger"
license=('Apache-2.0')
depends=('spdlog' 'fmt')
makedepends=('cmake' 'git')
provides=('tt-logger=1.1.6')
conflicts=('tt-logger')
source=("$pkgname::git+https://github.com/tenstorrent/tt-logger.git#tag=v${pkgver}")
sha256sums=('b5c50bc53da2bd9392807e89b07b7b32be5227264f63dd969cb0b8629963d06f')

build() {
    cd "$pkgname"
    # Nothing
}

package() {
    cd "$srcdir"/"$pkgname"
    
    # HACK: We just want the headers
    mkdir -p "$pkgdir/usr/include"
    cp -r include "$pkgdir/usr/"
}
