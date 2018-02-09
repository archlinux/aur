# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=lightning-app
pkgver=0.1.5
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
sha256sums=('025fbf054e5d746515e514a60d4027de3896959cece1563987c3eb04c4928ea4'
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
