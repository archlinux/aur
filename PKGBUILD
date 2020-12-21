# Maintainer: Jorengarenar <dev@joren.ga>

pkgname=libxdgdirs
_pkgname=libXDGdirs
pkgver=1.0.2
pkgrel=1
pkgdesc="An implementation of XDG Base Directory Specification in C"
arch=('x86_64')
url="https://github.com/Jorengarenar/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${_pkgname}::https://github.com/Jorengarenar/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')

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
