# Maintainer: metaanon [at] mailbox dotorg  
# Maintainer: strahe
# Maintainer: tyjak

pkgname=binance
pkgver=1.15.3
pkgrel=1
pkgdesc="The Binance desktop application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
depends=('electron')
source=('https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb')
source=("${pkgname}-${pkgver}.deb::https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb")
sha256sums=('9d0eb9a4f538c91cc9a2a3cac546c20a303a8701cb3c18b8a49483551de22880')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir "${pkgdir}/usr/bin"
    ln -s /opt/Binance/binance "${pkgdir}/usr/bin/binance"
}
