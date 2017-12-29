# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=lightning-app
pkgver=0.1.4
pkgrel=1
pkgdesc="Lightning Network Desktop Wallet"
arch=('x86_64')
url="https://github.com/lightninglabs/lightning-app"
license=('GPL')
depends=()
source=("https://github.com/lightninglabs/lightning-app/releases/download/v${pkgver}-alpha/Lightning-linux-x64v${pkgver}.tar.gz"
        "lightning-app.desktop"
        "lightning-app.png")
noextract=()
sha256sums=('ce25f5d74a8a313c587d1d59b9131ba863260fa97d59366704f7e5955079c266'
            'SKIP'
            'SKIP')
validpgpkeys=()

package() {
    install -d ${pkgdir}/opt/${pkgname}
    cp -r ${srcdir}/Lightning-linux-x64/* ${pkgdir}/opt/${pkgname}

    install -Ddm755 ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/Lightning ${pkgdir}/usr/bin/lightning-app

    install -Dm644 ${srcdir}/lightning-app.desktop ${pkgdir}/usr/share/applications/lightning-app.desktop
    install -Dm644 ${srcdir}/lightning-app.png ${pkgdir}/usr/share/pixmaps/lightning-app.png
}
