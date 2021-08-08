pkgname=icalingua
pkgver=2.1.4
pkgrel=1
pkgdesc='A Linux client for QQ and more'
license=('GPL')
depends=('ffmpeg')
depends_x86_64=('electron')
depends_aarch64=('electron13')
depends_i686=('electron13')
optdepends=('mongodb-bin: Provides storage'
            'redis: Provides storage')
arch=('aarch64' 'x86_64' 'i686')
url="https://github.com/Clansty/Icalingua"
provides=('electron-qq')
conflicts=('electron-qq')
replaces=('electron-qq')
source=(512x512.png
        ${pkgname}.desktop)
source_x86_64=("app-x86_64-${pkgver}.asar::https://github.com/Clansty/Icalingua/releases/download/v${pkgver}/app-x86_64.asar"
               ${pkgname}-x86_64)
source_aarch64=("app-aarch64-${pkgver}.asar::https://github.com/Clansty/Icalingua/releases/download/v${pkgver}/app-arm64.asar"
                ${pkgname}-aarch64)
source_i686=("app-i686-${pkgver}.asar::https://github.com/Clansty/Icalingua/releases/download/v${pkgver}/app-ia32.asar"
             ${pkgname}-i686)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "app-${CARCH}-${pkgver}.asar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.asar"
    install -Dm755 "${pkgname}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/electron-qq"
}
sha256sums=('84c8585e8c18504ed83b0d199831b55b9f8f0eb0a5aa4cb9e3dc01b4a17d0e38'
            '119484b280c0e5aac03f979488a5edbb4170d214e4f5f7328d779c79d653c376')
sha256sums_aarch64=('45beab8d42e080705a574c93ed1970e4aa1bdc4a47c4c17ab6d224ef2bd309d6'
                    'adea3026fdf54175f518b9cbb6d3e2f5f08ce2ebb9e73933b86f26f8c026ff56')
sha256sums_x86_64=('c622c94249facd7b3a9b7fd4503c2178c6dece63a559d335d071510c4368291e'
                   '60eebcac935e9fbf834ee3e7ee2e0a058fc6b22f39faa9734244f0b6b316678b')
sha256sums_i686=('0f0eac0f13c46d7b74f5a6b3280f0a906cd3626f20c20db05853e994b714dbc7'
                 'adea3026fdf54175f518b9cbb6d3e2f5f08ce2ebb9e73933b86f26f8c026ff56')
