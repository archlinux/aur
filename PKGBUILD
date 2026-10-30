# Maintainer: x70b1
pkgname=('hyprland-plugin-hy3')
pkgver='0.57.0'
pkgrel=1.1
pkgdesc='A Hyprland plugin for i3 like tiling'
arch=('x86_64')
url='https://github.com/outfoxxed/hy3'
license=('GPL3')
depends=("hyprland>=0.57.0" "hyprland<0.58.0")
makedepends=('git' 'cmake' 'hyprland')
source=("${pkgname}::git+${url}.git#commit=4c0199b42967b3511e3520b75cfa1f6411fb7e87")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cmake -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hy3/LICENSE"
}
