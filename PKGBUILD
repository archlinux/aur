# Maintainer: Lukasz Gasior <lukas.gasior@gmail.com>

pkgname=galleon-prod
pkgver=0.8.2b
pkgrel=1
pkgdesc="A wallet for the Tezos blockchain"
arch=('x86_64')
url="https://github.com/Cryptonomic/Tezori"
depends=('libxss' 'gtk3' 'nss' 'gconf')
source=("https://cryptonomic-wallet.nyc3.digitaloceanspaces.com/release_0.8.2b/Galleon-0.8.2-b.deb")
noextract=('Galleon-0.8.2-b.deb')
license=('GPL3')
md5sums=('ce18e0c94e4693f5a3e517c02cae2362')

prepare() {
    ar x Galleon-0.8.2-b.deb data.tar.xz
    tar xf data.tar.xz
    rm data.tar.xz
    rm Galleon-0.8.2-b.deb
}

package() {
    mv opt "${pkgdir}/opt"
    mv usr "${pkgdir}/usr"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/Galleon/galleon" "${pkgdir}/usr/bin/galleon-prod"
}

