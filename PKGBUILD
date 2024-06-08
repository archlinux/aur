# Maintainer: normal <marlon@kern.earth>
# Contributor: Mr.Smith1974

pkgname=fallout2-ce-game
_gitname=fallout2-ce
pkgver=1.3.0
pkgrel=4
pkgdesc="Fallout 2 for modern operating systems"
arch=('x86_64')
url="https://github.com/alexbatalov/fallout2-ce"
license=('custom:SUL')
depends=('sdl2')
makedepends=('cmake' 'git')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/alexbatalov/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2fcb58dd77eb025ac7a0a8f36699241e2303f9a7078ba563a3bfd424cbeb804a')

build() {
    cd "${_gitname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=Release ./
    make
}

package() {
    cd "${_gitname}-${pkgver}"
    DESTDIR="$pkgdir" cmake --install . --prefix "/usr"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

