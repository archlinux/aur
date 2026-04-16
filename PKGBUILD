# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=tt-logger
pkgver=1.1.9
pkgrel=1
pkgdesc="A flexible and performant C++ logging library for Tenstorrent projects"
arch=('x86_64')
url="https://github.com/tenstorrent/tt-logger"
license=('Apache-2.0')
depends=('spdlog' 'fmt')
makedepends=('cmake' 'git')
provides=('tt-logger=1.1.8')
conflicts=('tt-logger')
source=("$pkgname::git+https://github.com/tenstorrent/tt-logger.git#tag=v${pkgver}")
sha256sums=('2225d70f7df6643df1c43c87dba1a00342bcd2252c60fcc464b9e2c93aba6c17')

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
