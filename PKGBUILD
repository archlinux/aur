# Maintainer: ninjaytxz <ninjaytxz.help at gmail dot com>
pkgname=sortify-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A flexible automated file sorter with custom themes and extensions"
arch=('x86_64')
url="https://github.com/ninjaytxz/Sortify"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3')
provides=('sortify')
conflicts=('sortify')
options=('!strip')
source=("Sortify-${pkgver}-Linux-x64::https://github.com/ninjaytxz/Sortify/releases/download/v${pkgver}/Sortify-${pkgver}-Linux-x64"
        "sortify.desktop"
        "sortify.png::https://raw.githubusercontent.com/ninjaytxz/Sortify/main/Documentation%20assets/Sortify%20logo.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # Install binary
    install -Dm755 "${srcdir}/Sortify-${pkgver}-Linux-x64" "${pkgdir}/usr/bin/sortify"

    # Install desktop entry
    install -Dm644 "${srcdir}/sortify.desktop" "${pkgdir}/usr/share/applications/sortify.desktop"

    # Install icon
    install -Dm644 "${srcdir}/sortify.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/sortify.png"
}
