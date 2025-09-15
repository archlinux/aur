# Maintainer: liammmcauliffe <https://github.com/liammmcauliffe>
pkgname=hyprworm
pkgver=1.1.1
pkgrel=1
pkgdesc="A fast and lightweight window switcher for Hyprland built in C"
arch=('x86_64' 'aarch64')
url="https://github.com/liammmcauliffe/hyprworm"
license=('MIT')
depends=('cjson')
makedepends=('git' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/liammmcauliffe/hyprworm/archive/v$pkgver.tar.gz")
sha256sums=('88f00654568080b6c4e0bed3b557996f6929238b3f23a66f3e695b07c292a4d6')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
