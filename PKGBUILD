# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=waybar-eyes
pkgver=0.12
pkgrel=3
pkgdesc='Waybar toy to help you blinking eyes and move your ass away from computer.'
arch=('x86_64' 'aarch64')
url="https://github.com/cyrinux/${pkgname}"
license=('ISC')
depends=('glibc' 'otf-font-awesome' 'opencv' 'qt5-base' 'hdf5')
makedepends=('go' 'make' 'git')
source=("${pkgname}-v${pkgver}-src.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-src.tar.gz"
    "${pkgname}-v${pkgver}-src.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-src.tar.gz.asc")
validpgpkeys=('C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums=('bb2c547dda1c6deb6b541163d0e5301cbf0964d328c30e1337c6e99962d6ef72'
    'SKIP')

build() {
    cd "${pkgname}-v${pkgver}"
    make release VERSION=v${pkgver}
}

package() {
    cd "${pkgname}-v${pkgver}"
    make install DESTDIR="${pkgdir}"
}
