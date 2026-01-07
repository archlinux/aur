# Maintainer: macinteuch <tetrasdev@protonmail.com>

pkgname=binance-desktop
pkgver=2.1.0
pkgrel=1
pkgdesc="The Binance desktop application. Github releases channel"
conflicts=('binance')
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
checkdepends=('curl' 'coreutils')
source=("${pkgname}-${pkgver}.deb::https://github.com/binance/desktop/releases/download/v${pkgver}/binance-${pkgver}-amd64-linux.deb")
sha256sums=('8b05ddbeb15f0d40e9554d27a37bb0695ac01da3f96ab5626da2d9fb8cce560c')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir "${pkgdir}/usr/bin"
    ln -s /opt/Binance/binance "${pkgdir}/usr/bin/binance"
}