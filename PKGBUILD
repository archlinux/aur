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
            'a768bd7dafa5238d6575bc4779757d0da2a5fb01af7fc7015205723c6feaf860'
            '82eb80e832b83d8bd28e1decb5e89d2ba24d41823c38f43530e4f4142d52a4a0'
            'ed125c07488c20211119668cd09f73eff4f36fa017f78c1d331388c5af507106'
            '8aa7dc98faa3a094f5a2ae8c0ad1ff7a65d295b8b3705c5707ec184570d67195')

package() {
    install -Dm755 "${srcdir}/hytale-launcher" "${pkgdir}/opt/${pkgname}/hytale-launcher"
    install -Dm755 "${srcdir}/hytale-launcher.sh" "${pkgdir}/usr/bin/hytale-launcher"

    install -Dm644 "${srcdir}/hytale-launcher.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.hypixel.HytaleLauncher.png"
    install -Dm644 "${srcdir}/hytale-launcher.desktop" "${pkgdir}/usr/share/applications/com.hypixel.HytaleLauncher.desktop"
}
