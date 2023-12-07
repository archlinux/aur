# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.5.0
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust" "clang" "blueprint-compiler")
depends=("gtk4" "hwdata")
arch=('x86_64' 'aarch64')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ilya-zlobintsev/LACT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1f9c28f9f144ce285dcaa8badf62349e9e9d03a0aac228066d91857a40946676')
install=lact.install

build() {
    cd "LACT-${pkgver}"
    make
}

package() {
    cd "LACT-${pkgver}"
    DESTDIR="${pkgdir}/usr" make install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
