pkgname=icalingua-plus-plus
_pkgname=icalingua
pkgver=2.5.1
pkgrel=1
pkgdesc='A  branch of deleted Icalingua,with limited support'
license=('AGPL3')
depends=('ffmpeg' 'electron13' 'libappindicator-gtk3')
optdepends=('mongodb-bin: Provides storage'
            'redis: Provides storage')
arch=('aarch64' 'x86_64' 'i686')
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
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
sha256sums=('f87b876d5b619a13104d94278f24753b1732fab2413131ebbd6c774495a35cea'
            'b088d20934708c53e50492694efefbf9a9dcb62fefb8d1d4976f36f32f84af86'
            'a1cbce70262a3bf3c9a51b1be178378eae13ed454f557f1526b24af87d0be6aa')
sha256sums_aarch64=('84099e04b4f474d5d801dcd641afea535c72a5442196e7094bb050faffbe9912')
sha256sums_x86_64=('fc921e88414254927bb09fa0697dc92a7114089077ae2336f0a913fecdbabeb0')
sha256sums_i686=('04186309ba46a3d4b52edb671e7b2617e1e135b82f4392abf0b7d96b6d6cac0b')