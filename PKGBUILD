appname="zen-adblocker"
pkgname="${appname}"-bin
pkgver="0.30.0"
pkgrel=1
pkgdesc="An open-source system-wide ad-blocker and privacy guard"
arch=('x86_64')
url="https://github.com/irbis-sh/zen-desktop"
license=('MIT')
depends=('networkmanager' 'glib2' 'webkit2gtk-4.1')
conflicts=('zen-adblocker')
provides=('zen-adblocker')
source=("Zen_linux_amd64_${pkgver}.tar.gz::https://github.com/irbis-sh/zen-desktop/releases/download/v${pkgver}/Zen_linux_amd64_noselfupdate.tar.gz"
        "${appname}.desktop"
        "appicon.png::https://github.com/irbis-sh/zen-desktop/blob/v${pkgver}/assets/appicon.png?raw=true"
        "LICENSE::https://github.com/irbis-sh/zen-desktop/blob/v${pkgver}/LICENSE?raw=true")
sha256sums=('f426623237f1119a38fcaf368fa4fbd7ad41c10af5eeaec2bb8f19d703f00694'
            '7b6c41cdbef78fc8e8dec47f3e56124496b4f782c397b25b635e81481c2640e8'
            '86c811ab545ee63d398ddc2da04a75d968d349102a4b73a087e01cebc346f1e2'
            '99c93a427534ef439924e7ed801092a7f3dea6b8029f2973e4238bca008e9d1e')

package() {
    install -Dm755 "${srcdir}/Zen" "${pkgdir}/usr/bin/${appname}"
    install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "./${appname}.desktop" "${pkgdir}/usr/share/applications/${appname}.desktop"
    install -Dm644 "./appicon.png" "${pkgdir}/usr/share/pixmaps/${appname}.png"
}
