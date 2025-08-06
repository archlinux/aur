appname="zen-adblocker"
pkgname="${appname}"-bin
pkgver="0.11.3"
pkgrel=1
pkgdesc="An open-source system-wide ad-blocker and privacy guard"
arch=('x86_64')
url="https://github.com/anfragment/zen"
license=('MIT')
depends=('networkmanager' 'glib2' 'webkit2gtk-4.1')
conflicts=('zen-adblocker')
provides=('zen-adblocker')
source=("Zen_linux_amd64_${pkgver}.tar.gz::https://github.com/anfragment/zen/releases/download/v${pkgver}/Zen_linux_amd64_noselfupdate.tar.gz"
        "${appname}.desktop"
        "appicon.png::https://github.com/anfragment/zen/blob/v${pkgver}/assets/appicon.png?raw=true"
        "LICENSE::https://github.com/anfragment/zen/blob/v${pkgver}/LICENSE?raw=true")
sha256sums=('327936b5db32ca4d17e6433bf904d08571e856d18b257aec427e58fe528cd42d'
            'b8fd4a272875b236b953bbeca99459cfcd6d6e10a1d00cf50eaadf742db27fc2'
            '86c811ab545ee63d398ddc2da04a75d968d349102a4b73a087e01cebc346f1e2'
            'd39888b5658d9207779b855f1626eca78ab97525dc2dbcdb1df4ebc199d414a6')

package() {
    install -Dm755 "${srcdir}/Zen" "${pkgdir}/usr/bin/${appname}"
    install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "./${appname}.desktop" "${pkgdir}/usr/share/applications/${appname}.desktop"
    install -Dm644 "./appicon.png" "${pkgdir}/usr/share/pixmaps/${appname}.png"
}
