# Maintainer: Rafa <rafael at chavantes dot com>
# Contributor: metaanon
# Contributor: strahe
# Contributor: tyjak
pkgname=binance
pkgver=2.0.2
pkgrel=1
pkgdesc="The Binance desktop application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils')
source=("${pkgname}-${pkgver}.deb::https://github.com/binance/desktop/releases/download/v${pkgver}/binance-${pkgver}-amd64-linux.deb")
sha256sums=('6d384945c4090a99c418d2953b9741594aa3b077df0e03ac1b68e7a4c2188f36')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/Binance/binance "${pkgdir}/usr/bin/binance"
}
