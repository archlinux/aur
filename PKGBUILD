# Source: https://launcher.hytale.com/version/release/launcher.json
# Maintainer: SCDevel <root@scdevel.net>

pkgname=hytale-launcher-bin
pkgver=2026.01.10.ff8feba
pkgrel=3
pkgdesc="Hytale Launcher (Native Linux, Self-Updating)"
arch=('x86_64')
url="https://hytale.com"
license=('custom:proprietary')
depends=('hicolor-icon-theme' 'glib2' 'webkit2gtk-4.1' 'gtk3')
options=('!strip' '!debug')
install="hytale-launcher.install"

# We split the pkgver back into the date and commit parts for the URL
_date=$(echo $pkgver | cut -d. -f1-3)
_commit=$(echo $pkgver | cut -d. -f4)

source=("hytale-launcher.zip::https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-${_date}-${_commit}.zip"
        "hytale-launcher.install"
        "hytale-launcher.sh"
        "hytale-launcher.png"
        "hytale-launcher.desktop")

# generated with: updpkgsums
sha256sums=('89897665202871d62623fa7ce1b64970622cca34554aa89921b650ab70066f20'
            '20dcdc016fa799ec08fcab656090f065742993ea332240360063105f44b1f27b'
            '00b9c3c71ff20e37f3d19442646793484fdc9071b15924448f9702268b15f2fb'
            'ed125c07488c20211119668cd09f73eff4f36fa017f78c1d331388c5af507106'
            '8aa7dc98faa3a094f5a2ae8c0ad1ff7a65d295b8b3705c5707ec184570d67195')

package() {
    install -Dm755 "${srcdir}/hytale-launcher" "${pkgdir}/opt/${pkgname}/hytale-launcher"
    install -Dm755 "${srcdir}/hytale-launcher.sh" "${pkgdir}/usr/bin/hytale-launcher"

    install -Dm644 "${srcdir}/hytale-launcher.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.hypixel.HytaleLauncher.png"
    install -Dm644 "${srcdir}/hytale-launcher.desktop" "${pkgdir}/usr/share/applications/com.hypixel.HytaleLauncher.desktop"
}
