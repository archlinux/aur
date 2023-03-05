# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.3.2
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust")
depends=("gtk4" "hwdata")
arch=('x86_64' 'aarch64')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ilya-zlobintsev/LACT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('05e0633a78c6c125b1e0dc72748345b42541b840ab408a6f7b0c266c6c01843a')
build() {
    cd LACT-${pkgver}
    make
}

package() {
    cd LACT-${pkgver}
    DESTDIR=${pkgdir}/usr make install
}
