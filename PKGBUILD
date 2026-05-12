# Maintainer: Sovetchat <support@sovetchat.ru>
pkgname=sovet
pkgver=2.15.3
pkgrel=1
pkgdesc="ЗАЩИЩЕННЫЙ МЕССЕНДЖЕР // АНОНИМНОСТЬ И БЕЗОПАСНОСТЬ"
arch=('x86_64')
url="https://sovetchat.ru"
license=('custom')
depends=('fuse2')
options=('!strip')
source_x86_64=("Soviet_2.15.3_amd64.AppImage::https://updates.sovetchat.ru/downloads/Soviet_2.15.3_amd64.AppImage")
sha256sums_x86_64=('b209eb656ac59526e1ad0f893a273ac266eeb4e51c783dbc1de3df04795ddac3')

package() {
    install -Dm755 "${srcdir}/Soviet_2.15.3_amd64.AppImage" "${pkgdir}/opt/Soviet/Soviet.AppImage"
    chmod +x "${pkgdir}/opt/Soviet/Soviet.AppImage"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/Soviet/Soviet.AppImage "${pkgdir}/usr/bin/sovet"

    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/sovet.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Совет
Comment=ЗАЩИЩЕННЫЙ МЕССЕНДЖЕР
Exec=/usr/bin/sovet
Icon=sovet
Type=Application
Categories=Network;Chat;
DESKTOP
}
