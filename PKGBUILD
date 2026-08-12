# Maintainer: araragi <cs_italy@live.cn>

pkgname=hyprliquid
pkgver=0.1.0
pkgrel=1
pkgdesc="A plugin for Hyprland that brings Liquid Glass, Acrylic, Mica, and Aero material effects to windows and layer surfaces."
arch=('x86_64')
depends=('hyprland>=0.56.0')
makedepends=('cmake' 'stb' 'hyprwayland-scanner')
url="https://github.com/zaregototsukai/hyprliquid"
license=('BSD 3-Clause')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8cd81e88687193130328f1ad00b2f537ace9723e66c6cc2052309d196a6cb61')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/Release/libhyprliquid.so "${pkgdir}/usr/lib/libhyprliquid.so"
}