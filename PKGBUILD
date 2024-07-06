# Maintainer: Jorengarenar

pkgname=libxdgdirs
_pkgname=libXDGdirs
pkgver=1.1.2
pkgrel=1
pkgdesc="An implementation of XDG Base Directory Specification in C"
arch=('x86_64')
url="https://github.com/Jorengarenar/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${_pkgname}::https://github.com/Jorengarenar/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('72abbf56ce9ef0fcaad47c851006987f4dd6b57d35e1724207ac7363596b87e9')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cmake -B build/ -DCMAKE_BUILD_TYPE=Release
    cmake --build build --config=Release
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cmake --install build --prefix "${pkgdir}/usr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
