# Maintainer: mechakotik

pkgname=tails-adventure
pkgver=d1.4.1
_gitname=TailsAdventure
_gitver=demo-1.4.1

pkgrel=1
pkgdesc="Open source remake of Tails Adventure for modern platforms"
url="https://github.com/mechakotik/TailsAdventure"
arch=('x86_64')
license=('GPL')

source=("${pkgname}-${pkgver}::https://github.com/mechakotik/$_gitname/archive/$_gitver.tar.gz")
sha256sums=('136dacbb2c51b4908cf206017baa3d614a1f009d98347f45b315610e1118d336')

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
    arch-meson $_gitname-$_gitver build -Dlinux_install=true
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
