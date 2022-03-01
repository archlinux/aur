pkgname=icalingua-plus-plus
_pkgname=icalingua
pkgver=2.5.2
pkgrel=1
pkgdesc='A branch of deleted Icalingua,with limited support'
license=('AGPL3')
depends=('ffmpeg' 'electron13' 'libappindicator-gtk3')
optdepends=('mongodb-bin: Provides storage'
            'redis: Provides storage')
arch=('aarch64' 'x86_64' 'i686')
url="https://github.com/Icalingua/Icalingua"
provides=('electron-qq' 'icalingua')
conflicts=('electron-qq')
replaces=('electron-qq')
source=(512x512.png
        ${_pkgname}.desktop
        ${_pkgname})
source_x86_64=("app-x86_64-${pkgver}.asar::https://github.com/Icalingua-plus-plus/Icalingua-plus-plus/releases/download/v${pkgver//_/-}/app-x86_64.asar")
source_aarch64=("app-aarch64-${pkgver}.asar::https://github.com/Icalingua-plus-plus/Icalingua-plus-plus/releases/download/v${pkgver//_/-}/app-arm64.asar")
source_i686=("app-i686-${pkgver}.asar::https://github.com/Icalingua-plus-plus/Icalingua-plus-plus/releases/download/v${pkgver//_/-}/app-ia32.asar")

package() {
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${_pkgname}.desktop"
    install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
    install -Dm644 "app-${CARCH}-${pkgver}.asar" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}.asar"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/electron-qq"
}
sha256sums=('84c8585e8c18504ed83b0d199831b55b9f8f0eb0a5aa4cb9e3dc01b4a17d0e38'
            '43da1c99b7a6aee974c20da3bcf925b660dff4ba44a447c86066c84c8bc95fbd'
            'a1cbce70262a3bf3c9a51b1be178378eae13ed454f557f1526b24af87d0be6aa')
sha256sums_aarch64=('595115a1c0e6ff6a63964ea04ad14cfe895ed21296ff66a1425e3fb5cfbef230')
sha256sums_x86_64=('ab75faaba34d197662c89ca0f7bf7d164b07ab58923521c6bd68419a9821e621')
sha256sums_i686=('92bda02c53dc367bf7db93de5206353d46d8326744f7cf66089d47526fd5f487')
