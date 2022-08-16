# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=waybar-eyes
pkgver=0.3
pkgrel=2
pkgdesc='Waybar toy to help you blinking eyes and move your ass away from computer.'
arch=('x86_64')
url="https://github.com/cyrinux/${pkgname}"
license=('ISC')
depends=('glibc' 'otf-font-awesome')
makedepends=('go' 'make' 'git' 'opencv')
source=("${pkgname}-v${pkgver}-src.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-src.tar.gz"
    "${pkgname}-v${pkgver}-src.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-src.tar.gz.asc")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3', 'C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums=('5846004a5a60819f5d914fd9d7340ba52229f30da3b65fa05146a56b1c3cac9a'
    'SKIP')

build() {
    cd "${pkgname}-v${pkgver}"
    make release VERSION=v${pkgver}
}

package() {
    cd "${pkgname}-v${pkgver}"
    make install DESTDIR="${pkgdir}"
}
