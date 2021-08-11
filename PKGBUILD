pkgname=icalingua
pkgver=2.1.5
pkgrel=1
pkgdesc='A Linux client for QQ and more'
license=('GPL')
depends=('ffmpeg' 'electron' 'libappindicator-gtk3')
optdepends=('mongodb-bin: Provides storage'
            'redis: Provides storage')
arch=('aarch64' 'x86_64' 'i686')
url="https://github.com/Clansty/Icalingua"
provides=('electron-qq')
conflicts=('electron-qq')
replaces=('electron-qq')
source=(512x512.png
        ${pkgname}.desktop
        ${pkgname})
source_x86_64=("app-x86_64-${pkgver}.asar::https://github.com/Clansty/Icalingua/releases/download/v${pkgver}/app-x86_64.asar")
source_aarch64=("app-aarch64-${pkgver}.asar::https://github.com/Clansty/Icalingua/releases/download/v${pkgver}/app-arm64.asar")
source_i686=("app-i686-${pkgver}.asar::https://github.com/Clansty/Icalingua/releases/download/v${pkgver}/app-ia32.asar")

package() {
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "app-${CARCH}-${pkgver}.asar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.asar"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/electron-qq"
}
sha256sums=('84c8585e8c18504ed83b0d199831b55b9f8f0eb0a5aa4cb9e3dc01b4a17d0e38'
            '43da1c99b7a6aee974c20da3bcf925b660dff4ba44a447c86066c84c8bc95fbd'
            '60eebcac935e9fbf834ee3e7ee2e0a058fc6b22f39faa9734244f0b6b316678b')
sha256sums_aarch64=('13a4f5bf43b16b4b1acc85ff8c28c6b45c8fbea84a44f020e8cc2fec51037ab7')
sha256sums_x86_64=('5016813a9f626dcf1a9a851941838e757fbdf3baa5bffb9e2abcd65d97edd3fc')
sha256sums_i686=('a9a6025401e249a490a658f6511aa279f924b2f58445b63674bb62e4bba1cb60')
