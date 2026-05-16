# Maintainer: Virgarakha <dev@orbyt.local>
pkgname=orbyt
pkgver=0.1.2.beta
pkgrel=1
pkgdesc="SSH terminal manager built with Electron and Next.js"
arch=('x86_64')
url="https://github.com/alvinades98/ORBYT"
license=('MIT')
depends=('fuse2')
options=('!strip')
source=("${pkgname}-${pkgver}.appimage::https://github.com/alvinades98/ORBYT/releases/download/v0.1.2-beta/ORBYT-0.1.2.appimage")
sha256sums=('e70194846d3615802401259c932c9f741209c50f5c8a2ee657524b673def15fb')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.appimage" "${pkgdir}/usr/bin/${pkgname}"

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
