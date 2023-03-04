# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.3.1
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust")
depends=("gtk4" "hwdata")
arch=('x86_64' 'aarch64')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ilya-zlobintsev/LACT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aafa4f6db8d1364cca80168b99876b59b294ddcacc435cd8bf3efa7438d06d71')
build() {
    cd LACT-${pkgver}
    make
}

package() {
    cd LACT-${pkgver}
    DESTDIR=${pkgdir}/usr make install
}
