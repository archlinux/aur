# Maintainer: Jorengarenar <dev@joren.ga>

pkgname=libxdgdirs
_pkgname=libXDGdirs
pkgver=1.0.4
pkgrel=2
pkgdesc="An implementation of XDG Base Directory Specification in C"
arch=('x86_64')
url="https://github.com/Jorengarenar/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${_pkgname}::https://github.com/Jorengarenar/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('20ec18ebef25a7c8c29602a827deb3dd9ee21d1a880bfa7cdb2052d237e5588b00a46ed831204904f5c2b8dd8282fc74b6af01b952a096aeeb7491a9882e6428')

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
