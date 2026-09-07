# Maintainer: araragi <cs_italy@live.cn>

pkgname=hyprliquid
pkgver=0.1.1
pkgrel=2
pkgdesc="A plugin for Hyprland that brings Liquid Glass, Acrylic, Mica, and Aero material effects to windows and layer surfaces."
arch=('x86_64')
depends=('hyprland>=0.56.2')
makedepends=('cmake' 'stb' 'hyprwayland-scanner')
url="https://github.com/zaregototsukai/hyprliquid"
license=('BSD 3-Clause')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('48fe637554caaf853a697ac07abcaf78501dc59c74b4684189b2fbddab801de1')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/Release/libhyprliquid.so "${pkgdir}/usr/lib/libhyprliquid.so"
}