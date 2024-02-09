# Maintainer: mechakotik <mechakotik@gmail.com>

pkgname=tails-adventure
pkgver=d1.5.1
_gitver=demo-1.5.1

pkgrel=1
pkgdesc="Open source remake of Tails Adventure for modern platforms"
url="https://github.com/mechakotik/tails-adventure"
arch=('x86_64')
license=('GPL')

source=("${pkgname}-${pkgver}::https://github.com/mechakotik/$pkgname/archive/$_gitver.tar.gz")
sha256sums=('475b18de6c34e118f498570122dc0c5fd4e169fcfca0a0695928fb3cac29374b')

depends=(
    'sdl2'
    'sdl2_image'
    'sdl2_mixer'
    'tinyxml2'
)

makedepends=(
    'base-devel'
    'meson'
)

build() {
    arch-meson $pkgname-$_gitver build -Dlinux_install=true
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
