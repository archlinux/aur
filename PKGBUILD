# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.4.4
pkgrel=3
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust" "clang")
depends=("gtk4" "hwdata")
arch=('x86_64' 'aarch64')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ilya-zlobintsev/LACT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('74e2c74004275b85ac7b07cf23b29da6acb7e2de10e67ccac7f397de1a902b84')
install=lact.install

build() {
    cd LACT-${pkgver}
    make
}

package() {
    cd LACT-${pkgver}
    DESTDIR=${pkgdir}/usr make install
}
