pkgname=fallout2-ce-game
_gitname=fallout2-ce
pkgver=1.2.0
pkgrel=1
pkgdesc="Fallout 2 for modern operating systems"
arch=('x86_64')
url="https://github.com/alexbatalov/fallout2-ce"
license=('custom:SUL')
depends=('sdl2')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/alexbatalov/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ae550f10dfd5319128d5276509da870f0651ee69f4216502e75cb35035866c8')


build() {
    cd "${_gitname}-${pkgver}"
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ./
    make
}

package() {
    cd "${_gitname}-${pkgver}"
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}

