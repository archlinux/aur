pkgname=icalingua
pkgver=2.3.2
pkgrel=1
pkgdesc='A Linux client for QQ and more'
license=('GPL')
depends=('ffmpeg' 'electron' 'libappindicator-gtk3')
optdepends=('mongodb-bin: Provides storage'
            'redis: Provides storage')
arch=('aarch64' 'x86_64' 'i686')
url="https://github.com/Icalingua/Icalingua"
provides=('electron-qq')
conflicts=('electron-qq')
replaces=('electron-qq')
source=(512x512.png
        ${pkgname}.desktop
        ${pkgname})
source_x86_64=("app-x86_64-${pkgver}.asar::https://github.com/Icalingua/Icalingua/releases/download/v${pkgver}/app-x86_64.asar")
source_aarch64=("app-aarch64-${pkgver}.asar::https://github.com/Icalingua/Icalingua/releases/download/v${pkgver}/app-arm64.asar")
source_i686=("app-i686-${pkgver}.asar::https://github.com/Icalingua/Icalingua/releases/download/v${pkgver}/app-ia32.asar")

package() {
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "app-${CARCH}-${pkgver}.asar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.asar"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/electron-qq"
}
sha256sums=('84c8585e8c18504ed83b0d199831b55b9f8f0eb0a5aa4cb9e3dc01b4a17d0e38'
            '43da1c99b7a6aee974c20da3bcf925b660dff4ba44a447c86066c84c8bc95fbd'
            'e56bfefdb9eb5365075e9b267d0aa33d6412ace99f4f21560c77ab1f1c5b501e')
sha256sums_aarch64=('31c7210f5e5f3dfe21ff4673a6a7419c3cbed00b0344c737bdb85d110a46da86')
sha256sums_x86_64=('9849359f99f2bf6947464e99fe5f357a0c7fce5b354de30846c1e95c2eeb2799')
sha256sums_i686=('63ba1215bd8bfb4dfce22a8468b9447c52702e347f45d9515c7a2a56d9ced72c')
