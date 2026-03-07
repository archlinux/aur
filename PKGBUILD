# Maintainer: hitalin <https://github.com/hitalin>
pkgname=misskey-notedeck-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Misskey deck client for desktop'
arch=('x86_64')
url='https://github.com/hitalin/notedeck'
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'glib-networking')
provides=('notedeck')
conflicts=('notedeck' 'notedeck-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hitalin/notedeck/releases/download/v${pkgver}/NoteDeck-${pkgver}-linux-x64.tar.gz"
        "notedeck.desktop"
        "notedeck-icon-128.png::https://raw.githubusercontent.com/hitalin/notedeck/v${pkgver}/src-tauri/icons/128x128.png"
        "notedeck-icon-32.png::https://raw.githubusercontent.com/hitalin/notedeck/v${pkgver}/src-tauri/icons/32x32.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "${srcdir}/notedeck" "${pkgdir}/usr/bin/notedeck"
    install -Dm644 "${srcdir}/notedeck.desktop" "${pkgdir}/usr/share/applications/com.notedeck.desktop.desktop"
    install -Dm644 "${srcdir}/notedeck-icon-128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.notedeck.desktop.png"
    install -Dm644 "${srcdir}/notedeck-icon-32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/com.notedeck.desktop.png"
}
