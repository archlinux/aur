# Maintainer: metaanon [at] mailbox dotorg  
# Maintainer: strahe
# Maintainer: tyjak

pkgname=binance
pkgver=1.15.2
pkgrel=1
pkgdesc="The Binance desktop application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
depends=('electron')
source=('https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb')
source=("${pkgname}-${pkgver}.deb::https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb")
sha256sums=('00f85c34fdb270fb0e3f030c07ed00faef28273a0dc8dc0433929ed22deeb53f')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir "${pkgdir}/usr/bin"
    ln -s /opt/Binance/binance "${pkgdir}/usr/bin/binance"
}
