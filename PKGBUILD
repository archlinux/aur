# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=tt-logger
pkgver=1.1.6
pkgrel=1
pkgdesc="A flexible and performant C++ logging library for Tenstorrent projects"
arch=('x86_64')
url="https://github.com/tenstorrent/tt-logger"
license=('Apache-2.0')
depends=('spdlog' 'fmt')
makedepends=('cmake' 'git')
provides=('tt-logger')
conflicts=('tt-logger')
source=("$pkgname::git+https://github.com/tenstorrent/tt-logger.git#tag=v${pkgver}")
sha256sums=('6b55f54502b4dc6348879258d00d752169c5f9a9acd48235039cf9794bb84a60')

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
