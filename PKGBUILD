# Maintainer: Lukasz Gasior <lukas.gasior@gmail.com>

pkgname=galleon-prod
_pkgver=0.9.4
pkgver="${_pkgver}b"
pkgrel=1
pkgdesc="A wallet for the Tezos blockchain"
arch=('x86_64')
url="https://github.com/Cryptonomic/Tezori"
depends=('libxss' 'gtk3' 'nss' 'gconf')
source=("https://cryptonomic-wallet.nyc3.digitaloceanspaces.com/release_$pkgver/galleon_$_pkgver-b_amd64.deb")
noextract=("galleon-$_pkgver-b_amd64.deb")
license=('GPL3')
md5sums=('1247016968dd0f71f121051c1f26db02')

prepare() {
    ar x galleon_$_pkgver-b_amd64.deb data.tar.xz
    tar xf data.tar.xz
    rm data.tar.xz
    rm galleon_$_pkgver-b_amd64.deb
}

package() {
    mv opt "${pkgdir}/opt"
    mv usr "${pkgdir}/usr"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/Galleon/galleon" "${pkgdir}/usr/bin/galleon-prod"
}

