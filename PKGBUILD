# Maintainer: Virgarakha <dev@orbyt.local>
pkgname=orbyt
pkgver=0.1.0.beta
pkgrel=1
pkgdesc="SSH terminal manager built with Electron and Next.js"
arch=('x86_64')
url="https://github.com/Virgarakha/termius-clone"
license=('MIT')
depends=('fuse2')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Virgarakha/termius-clone/releases/download/v0.1.0-beta/ORBYT-0.1.0-beta.AppImage")
sha256sums=('1b6394e93983677d7c33fd939db2c4778d5f3284b464373cb5098d3d2879e50f')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=ORBYT
Comment=SSH terminal manager
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Network;RemoteAccess;
EOF
}
