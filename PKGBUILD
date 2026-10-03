# Maintainer: Rafa <rafael at chavantes dot com>
# Contributor: metaanon
# Contributor: strahe
# Contributor: tyjak
pkgname=binance
pkgver=2.4.1
pkgrel=1
pkgdesc="The Binance desktop application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libnotify' 'libsecret')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://download.binance.com/desktop/linux/production/binance-${pkgver}-amd64-linux.deb")
sha256sums=('de369ced61b613afc77f8ab0f24119bc40fc8b3074424f477ac401a96a42b5f7')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/Binance/binance "${pkgdir}/usr/bin/binance"
}
