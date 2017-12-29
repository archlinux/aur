# Maintainer: Bilal ELmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=pb-for-desktop
pkgrel=1
pkgver=6.7.7
pkgdesc="The missing Desktop application for Pushbullet"
url="https://github.com/sidneys/pb-for-desktop"
provides=('pb-for-desktop')
arch=('i686' 'x86_64')
license=('MIT')
depends=('libnotify' 'notify-osd' 'gconf' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libxtst' 'nss')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman")
sha256sums=('4db5072c6e86bbbbac650ffd31dcfadbbb6711fc8733a68eebb2172adf22473b')

package() {
    # Install the application files in /opt
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/opt/PB for Desktop" "${pkgdir}/opt/"
    # Install the .desktop file
    install -D -m644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Install the icons
    for icon_size in 16 24 32 48 64 96 128 256 512; do
        icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${pkgdir}/${icons_dir}"
        install -m644 "${srcdir}${icons_dir}/${pkgname}.png" \
                      "${pkgdir}${icons_dir}/${pkgname}.png"
    done

}
