# Maintainer: araragi <cs_italy@live.cn>

pkgname=hyprliquid
pkgver=0.2.0
pkgrel=1
pkgdesc="A plugin for Hyprland that brings Liquid Glass, Acrylic, Mica, and Aero material effects to windows and layer surfaces."
arch=('x86_64')
depends=('hyprland>=0.56.2')
makedepends=('cmake' 'stb' 'hyprwayland-scanner')
url="https://github.com/zaregototsukai/hyprliquid"
license=('BSD 3-Clause')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2772a24e765c2f89dd22e2748772386f57b2ee258ff37d4098b197d4e86a8b53')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/Release/libhyprliquid.so "${pkgdir}/usr/lib/libhyprliquid.so"
}