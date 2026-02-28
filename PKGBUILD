# Maintainer: Gélules
pkgname=binance-for-desktop
pkgver=###PKGVER###
pkgrel=1
pkgdesc="Binance for Desktop"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
depends=('gtk3' 'libxss' 'libxtst' 'nss' 'xdg-utils')
source=("${pkgname}-${pkgver}.deb::https://github.com/binance/desktop/releases/download/v${pkgver}/binance-${pkgver}-amd64-linux.deb")
sha256sums=('8b05ddbeb15f0d40e9554d27a37bb0695ac01da3f96ab5626da2d9fb8cce560c')

package() {
    bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}/"

    install -d "${pkgdir}/usr/bin"

    ln -s /opt/Binance/binance "${pkgdir}/usr/bin/binance"
}
