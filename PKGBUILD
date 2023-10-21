# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.4.5
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust" "clang")
depends=("gtk4" "hwdata")
arch=('x86_64' 'aarch64')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ilya-zlobintsev/LACT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1058a2cfd9f736be76e316fb11342eb79f3eec4558619dc59c6ee82548f3f7cf')
install=lact.install

build() {
    cd LACT-${pkgver}
    make
}

package() {
    cd LACT-${pkgver}
    DESTDIR=${pkgdir}/usr make install
}
