# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=concordium-node-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Node for the Concordium blockchain"
arch=('x86_64')
url="https://github.com/Concordium/concordium-node"
license=('AGPL3')
depends=('postgresql-libs' 'openssl' 'unbound')
install=concordium-node-bin.install
source=("https://distribution.mainnet.concordium.software/deb/concordium-node_${pkgver}-mainnet_amd64.deb")
sha256sums=('dcb76543e4fb0346242df1d8873bbdf89af6ccbd49ea6b4d315bd1dc4c14a135')

package() {
    tar xf data.tar.xz -C "${pkgdir}"
    rm -r "${pkgdir}/usr/share" # Delete changelog.Debian.gz
    mv "${pkgdir}/lib" "${pkgdir}/usr"
}
