appname="zen-adblocker"
pkgname="${appname}"-bin
pkgver="0.22.0"
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
sha256sums=('9b7141f53f44980f20efc32f0b1b9d56b974971c9db292d52689539aef919b84'
            'b8fd4a272875b236b953bbeca99459cfcd6d6e10a1d00cf50eaadf742db27fc2'
            '86c811ab545ee63d398ddc2da04a75d968d349102a4b73a087e01cebc346f1e2'
            '99c93a427534ef439924e7ed801092a7f3dea6b8029f2973e4238bca008e9d1e')

package() {
    install -Dm755 "${srcdir}/Zen" "${pkgdir}/usr/bin/${appname}"
    install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "./${appname}.desktop" "${pkgdir}/usr/share/applications/${appname}.desktop"
    install -Dm644 "./appicon.png" "${pkgdir}/usr/share/pixmaps/${appname}.png"
}
