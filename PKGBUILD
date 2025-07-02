# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=tt-logger-git
pkgver=r47.2ebf534
pkgrel=1
pkgdesc="A flexible and performant C++ logging library for Tenstorrent projects"
arch=('x86_64')
url="https://github.com/tenstorrent/tt-logger"
license=('Apache-2.0')
depends=('spdlog' 'fmt')
makedepends=('cmake' 'git')
provides=('tt-logger')
conflicts=('tt-logger')
source=("$pkgname::git+https://github.com/tenstorrent/tt-logger.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
