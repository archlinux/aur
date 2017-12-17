# Maintainer: Bilal ELmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=pb-for-desktop
pkgrel=1
pkgver=6.5.1
_pkgver="v$pkgver"
pkgdesc="The missing Desktop application for Pushbullet"
url="https://github.com/sidneys/pb-for-desktop"
provides=('pb-for-desktop')
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('unzip')
depends=('libnotify' 'gconf' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libxtst' 'nss')
source=("${url}/releases/download/${_pkgver}/${pkgname}-${pkgver}.pacman")
sha256sums=('969181618bd2b9565dc2e942137beee0f68c45c20e1cfeb515a0bda5b912e72a')

package() {
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/opt/PB for Desktop" "${pkgdir}/opt/"

    install -D -m644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for icon_size in 16 24 32 48 64 96 128 256 512; do
        icon_dir="${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        icon_dest="${srcdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${icon_dir}"
        install -m644 "${icon_dest}/${pkgname}.png"  "${icon_dir}/${pkgname}.png"
    done

}
