# Maintainer: araragi <cs_italy@live.cn>

pkgname=hyprliquid
pkgver=0.3.0
pkgrel=3
pkgdesc="A plugin for Hyprland that brings Liquid Glass, Acrylic, Mica, and Aero material effects to windows and layer surfaces."
arch=('x86_64')
depends=('hyprland>=0.57.0')
makedepends=('cmake' 'stb' 'hyprwayland-scanner')
url="https://github.com/zaregototsukai/hyprliquid"
license=('BSD 3-Clause')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('adbf9b8fea4f280f878796d15c1d6305f3b61ba7891f7fb5884164019052b657')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/Release/libhyprliquid.so "${pkgdir}/usr/lib/libhyprliquid.so"
}