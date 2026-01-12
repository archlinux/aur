# Source: https://launcher.hytale.com/version/release/launcher.json
# Maintainer: SCDevel <root@scdevel.net>

pkgname=hytale-launcher-bin
pkgver=2026.01.11.b022ef5
pkgrel=2
pkgdesc="Hytale Launcher (Native Linux, Self-Updating)"
url="https://hytale.com"
license=('LicenseRef-custom')
arch=('x86_64')
options=('!strip' '!debug')
depends=('hicolor-icon-theme' 'nss' 'libsecret' 'gtk3' 'libsoup3'
         'gdk-pixbuf2' 'glibc' 'bash' 'webkit2gtk-4.1' 'xdg-utils' 'glib2')
install="hytale-launcher.install"

# We split the pkgver back into the date and commit parts for the URL
_date=$(echo $pkgver | cut -d. -f1-3)
_commit=$(echo $pkgver | cut -d. -f4)

source=("hytale-launcher-${_date}-${_commit}.zip::https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-${_date}-${_commit}.zip"
        "hytale-launcher.install"
        "hytale-launcher.sh"
        "com.hypixel.HytaleLauncher.png"
        "com.hypixel.HytaleLauncher.desktop"
        "LICENSE")

# generated with: updpkgsums
sha256sums=('fbe201c5ad79b40fbd48db01c54d625b6283f97d753f1b9173018a7e7f0fe301'
            'a2a9076e8b0ac6ee006344d8e40cf29d21635c12052ec721dd8a7888c45339f8'
            'ff800b35b50d459717576f353a9100d1c95bcf119f610aeab2944b53a6a0cf15'
            'ed125c07488c20211119668cd09f73eff4f36fa017f78c1d331388c5af507106'
            '8aa7dc98faa3a094f5a2ae8c0ad1ff7a65d295b8b3705c5707ec184570d67195'
            '5782bcd7945501383cd6b589797549318cb8e494047c31944fc326ff51ae7047')

package() {
    install -Dm755 "${srcdir}/hytale-launcher" "${pkgdir}/opt/${pkgname}/hytale-launcher"
    install -Dm755 "${srcdir}/hytale-launcher.sh" "${pkgdir}/usr/bin/hytale-launcher"

    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.hypixel.HytaleLauncher.png"
    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.desktop" "${pkgdir}/usr/share/applications/com.hypixel.HytaleLauncher.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
