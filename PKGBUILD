# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.2.0
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust")
depends=("gtk4" "hwdata")
arch=('x86_64' 'aarch64')
backup=('etc/lact/config.yaml')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ilya-zlobintsev/LACT/archive/refs/tags/v${pkgver}.tar.gz" 
	"lactd.service" 
	"lact.desktop")
sha256sums=('c6f9aa2a543af7a6e8c039196cadedc21cbf6fd1585417aca2b4948943186250'
            '86f9f94f7f3f5b0f65710daf0701075836683a34245efee2d730b259bda30c67'
            '427a4ac2dc863af74bdb0bfa3514e20586de8872d3939cd2454ce7f1663fc21b')
build() {
    cd LACT-${pkgver}
    make
}

package() {
    cd LACT-${pkgver}
    DESTDIR=${pkgdir}/usr make install
}
