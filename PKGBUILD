# Maintainer: greyishsong <greyishsong@qq.com>
pkgname=bellit
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="Cross-platform CLI tool for sending desktop notification."
arch=('x86_64')
url="https://github.com/greyishsong/bellit"
license=('GPL-2.0-only')
groups=()
depends=()
makedepends=(clang ninja cmake git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug)
install=
changelog=
source=("https://github.com/greyishsong/bellit/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=("683621f30299ad8ef9c7c7e79264cf4f4a2e9188a88b9187e9e37644ced91b12")
validpgpkeys=()

build() {
    cd "${pkgname}-${pkgver}"
    cmake --preset default -DCMAKE_BUILD_TYPE=Release
    cmake --build --preset default
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgname}-${pkgver}/build"
    cp "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    chmod a+x "${pkgdir}/usr/bin/${pkgname}"
}
