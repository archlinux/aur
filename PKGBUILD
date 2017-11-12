# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=lightning-app
pkgver=0.1.2
pkgrel=1
pkgdesc="Lightning Network Desktop Wallet"
arch=('x86_64')
url="https://github.com/lightninglabs/lightning-app"
license=('GPL')
depends=()
source=("https://github.com/lightninglabs/lightning-app/releases/download/v${pkgver}alpha/Lightning-linux-x64v${pkgver}.tar.gz"
        "lightning-app.desktop"
        "lightning-app.png")
noextract=()
sha256sums=('f9b1e0d5de8b1e09ca0c50805a704fa5ed87e6aa9beb96854da35708fd4a1645'
            'SKIP'
            'SKIP')
validpgpkeys=()

package() {
    mkdir -p ${pkgdir}/opt/${pkgname}

    install -Ddm755 ${pkgdir}/usr/bin
    install -Dm644 ${srcdir}/lightning-app.desktop ${pkgdir}/usr/share/applications/lightning-app.desktop
    install -Dm644 ${srcdir}/lightning-app.png ${pkgdir}/usr/share/pixmaps/lightning-app.png

    cp -r ${srcdir}/Lightning-linux-x64/* ${pkgdir}/opt/${pkgname}
    ln -s ${pkgdir}/opt/${pkgname}/Lightning ${pkgdir}/usr/bin/lightning-app
}
