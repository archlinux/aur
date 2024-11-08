pkgname=libxdgdirs
_pkgname=libXDGdirs
pkgver=1.1.3
pkgrel=1
pkgdesc="An implementation helpers for XDG Base Directory Specification in C"
arch=('x86_64')
url="https://github.com/Jorenar/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${_pkgname}::https://github.com/Jorenar/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cc2f67b29d7faa15e6072c406e5483f5ff0787a811b62fd38c984b1ee9c005a6')

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
