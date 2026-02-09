# Maintainer: EunoiaCody <eunoiacody@gmail.com>
pkgname=gui-for-singbox-bin
_pkgname=GUI.for.SingBox
pkgver=1.19.0
pkgrel=1
pkgdesc="A graphical user interface for sing-box (Binary Release)"
arch=('x86_64')
options=('!strip' '!debug')
url="https://github.com/GUI-for-Cores/GUI.for.SingBox"
license=('GPL-3.0')
depends=('webkit2gtk-4.1' 'hicolor-icon-theme' 'gtk3')
makedepends=('unzip')
provides=("gui-for-singbox")
conflicts=("gui-for-singbox")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip"
        "gui-for-singbox.png::https://raw.githubusercontent.com/GUI-for-Cores/GUI.for.SingBox/refs/heads/main/build/appicon.png")

sha256sums=('2df3198200bed94c7d89f853b0563cc9931f323e2ce9353ed703bacf37634e22'
            '08257d0d21c76a56e48e38105460927293a452ddc6b0b62db401bf5b5b9b7adf')

package() {
    cd "${srcdir}"

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/gui-for-singbox"

    install -Dm644 "gui-for-singbox.png" "${pkgdir}/usr/share/pixmaps/gui-for-singbox.png"
    install -Dm644 "gui-for-singbox.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gui-for-singbox.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/gui-for-singbox.desktop" <<EOF
[Desktop Entry]
Name=GUI for SingBox
Comment=Graphical user interface for sing-box
Exec=/usr/bin/gui-for-singbox
Icon=gui-for-singbox
Type=Application
Categories=Network;
Terminal=false
EOF
}
