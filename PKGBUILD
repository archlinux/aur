# Maintainer: Lukasz Gasior <lukas.gasior@gmail.com>

pkgname=galleon-prod
pkgver=0.1.0b
pkgrel=1
pkgdesc="A wallet for the Tezos blockchain"
arch=('x86_64')
url="https://github.com/Cryptonomic/Tezori"
depends=('libxss' 'gtk3' 'nss' 'gconf')
source=("https://cryptonomic-wallet.nyc3.digitaloceanspaces.com/release_0.1.0b/galleon-prod_0.1.0-b_amd64.deb")
noextract=('galleon-prod_0.1.0-b_amd64.deb')
license=('GPL3')
md5sums=('bc9c53e9349a98e784e72768b1b7e7f2')

prepare() {
    ar x galleon-prod_0.1.0-b_amd64.deb data.tar.xz
    tar xf data.tar.xz
    rm data.tar.xz
    rm galleon-prod_0.1.0-b_amd64.deb
}

package() {
    mv opt "${pkgdir}/opt"
    mv usr "${pkgdir}/usr"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/galleon-prod/galleon-prod" "${pkgdir}/usr/bin/galleon-prod"
}

