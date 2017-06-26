# Maintainer: desolt <desolt@protonmail.com>
pkgname=jsonc
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple JSON library written in C."
arch=('any')
url="https://github.com/desolt/$pkgname"
license=('MIT')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" install
}
