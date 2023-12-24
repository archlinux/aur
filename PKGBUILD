# Maintainer: mechakotik

pkgname=tails-adventure
pkgver=d1.5.0
_gitname=TailsAdventure
_gitver=demo-1.5.0

pkgrel=1
pkgdesc="Open source remake of Tails Adventure for modern platforms"
url="https://github.com/mechakotik/TailsAdventure"
arch=('x86_64')
license=('GPL')

source=("${pkgname}-${pkgver}::https://github.com/mechakotik/$_gitname/archive/$_gitver.tar.gz")
sha256sums=('f9d556c34d02e06d0b4830cac7bc82f4f50ed00177c96987527df0085fb98142')

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
