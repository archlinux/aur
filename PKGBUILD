# Maintainer: Sovetchat <support@sovetchat.ru>
pkgname=sovet
pkgver=2.15.5
pkgrel=1
pkgdesc="ЗАЩИЩЕННЫЙ МЕССЕНДЖЕР // АНОНИМНОСТЬ И БЕЗОПАСНОСТЬ"
arch=('x86_64')
url="https://sovetchat.ru"
license=('custom')
depends=('fuse2')
options=('!strip')
source_x86_64=("Soviet_2.15.5_amd64.AppImage::https://updates.sovetchat.ru/downloads/Soviet_2.15.5_amd64.AppImage")
sha256sums_x86_64=('911a37df8c0fd1b5726d7c99aaa9e7afb1933ad5c37f6d61508f9e8fc28de0e9')

package() {
    install -d -m0777 "${pkgdir}/opt/Soviet"
    install -Dm777 "${srcdir}/Soviet_2.15.5_amd64.AppImage" "${pkgdir}/opt/Soviet/Soviet.AppImage"

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
