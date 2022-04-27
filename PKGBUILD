# Maintainer: Jorengarenar <dev@joren.ga>

pkgname=libxdgdirs
_pkgname=libXDGdirs
pkgver=1.1.0
pkgrel=1
pkgdesc="An implementation of XDG Base Directory Specification in C"
arch=('x86_64')
url="https://github.com/Jorengarenar/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${_pkgname}::https://github.com/Jorengarenar/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('98ec7c897d07aaf5f6526e0d308c8ffa6ffca5b45e36a7e966cb5c29180ddc0fd18287a286397b631f5cd3f573d063cbcc97c3b18ca931d3699b13f9b6f907a9')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cmake -B build/ -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cmake --install build --prefix "${pkgdir}/usr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
