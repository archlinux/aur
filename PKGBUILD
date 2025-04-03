# Maintainer: macinteuch <tetrasdev@protonmail.com>

pkgname=binance
pkgver=1.54.17
pkgrel=1
pkgdesc="The Binance desktop application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
checkdepends=('curl' 'coreutils')
source=("${pkgname}-${pkgver}.deb::https://github.com/binance/desktop/releases/download/v${pkgver}/binance-${pkgver}-amd64-linux.deb" "binance.desktop")
sha256sums=('b2da603eb6736143d4b46c70e5b87caa703b591decfbd2567f48d7046dbe5500' '11e9e94fe1851062301b34c90e13763f11b4c0e7774c3b1483d64b88ebc448cb')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    install -m644 "${srcdir}/binance.desktop" "${pkgdir}/usr/share/applications/binance.desktop"
    mkdir "${pkgdir}/usr/bin"
    ln -s /opt/Binance/binance "${pkgdir}/usr/bin/binance"
}