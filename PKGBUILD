# Maintainer: Jorengarenar <dev@joren.ga>

pkgname=libxdgdirs
_pkgname=libXDGdirs
pkgver=1.0.5
pkgrel=1
pkgdesc="An implementation of XDG Base Directory Specification in C"
arch=('x86_64')
url="https://github.com/Jorengarenar/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${_pkgname}::https://github.com/Jorengarenar/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4d876fc74bd027710b647de94bb0eb07ce0bea9fcff025de7dfb20fe84df376050b6bdc14840f8b73e81fec3ae3513812ebdb01bcd4badad4c41189a64dc5b17')

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
