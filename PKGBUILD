pkgname=fallout1-ce-game
_gitname=fallout1-ce
pkgver=1.0.0
pkgrel=1
pkgdesc="Fallout for modern operating systems"
arch=('x86_64')
url="https://github.com/alexbatalov/fallout1-ce"
license=('custom:SUL')
depends=('sdl2')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/alexbatalov/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6005e36d160e2686ca42df613dadd3311b025b3dea062458e99e214cc2cc5ee1')


build() {
    cd "${_gitname}-${pkgver}"
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ./
    make
}

package() {
    cd "${_gitname}-${pkgver}"
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}

