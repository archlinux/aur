# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.5.1
pkgrel=2
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust" "clang" "blueprint-compiler")
depends=("gtk4" "hwdata")
arch=('x86_64' 'aarch64')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ilya-zlobintsev/LACT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b2a21bcf99c3393dff8f72463a7d5e8e8a62767f59106a240ee9bb512dbc522')
install=lact.install

build() {
    cd "LACT-${pkgver}"
    make
}

package() {
    cd "LACT-${pkgver}"
    DESTDIR=${pkgdir} PREFIX=/usr make install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
