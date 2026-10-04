# Maintainer: Cogumelo cogumelo@tutamail.com
pkgname=plasma6-applets-wmp-toolbar-plasmoid-git
pkgver=0.0.1
pkgrel=1
license=('none')
arch=('x86_64')
pkgdesc="MPRIS controller that looks like the WMP toolbar"
url="https://gitgud.io/catpswin56/wmp-toolbar-plasmoid"
depends=('libplasma')
makedepends=('vulkan-headers' 'gcc' 'extra-cmake-modules')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
source=(git+"https://gitgud.io/catpswin56/wmp-toolbar-plasmoid.git")
sha256sums=('SKIP')

prepare() {
    cmake -S wmp-toolbar-plasmoid -B build -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
}

build() {
    cmake --build build
}

package() {
    cmake --install build
}
