# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=waybar-eyes
pkgver=0.4
pkgrel=1
pkgdesc='Waybar toy to help you blinking eyes and move your ass away from computer.'
arch=('x86_64')
url="https://github.com/cyrinux/${pkgname}"
license=('ISC')
depends=('glibc' 'otf-font-awesome' 'opencv' 'qt5-base')
makedepends=('go' 'make' 'git')
source=("${pkgname}-v${pkgver}-src.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-src.tar.gz"
    "${pkgname}-v${pkgver}-src.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-src.tar.gz.asc")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3', 'C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums=('fca8dae5e4ab27a168e09685ab9226ffbfd6184452dd8b41e1938e9a0e757ba2'
            'SKIP')

build() {
    cd "${pkgname}-v${pkgver}"
    make release VERSION=v${pkgver}
}

package() {
    cd "${pkgname}-v${pkgver}"
    make install DESTDIR="${pkgdir}"
}
