pkgname=affinity-appimage-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="Affinity Studio via AppImage"
arch=('x86_64')
url="https://github.com/ryzendew/Linux-Affinity-Installer"
license=('custom')
depends=('fuse2')
options=('!strip')

source=("Affinity.AppImage::https://github.com/ryzendew/Linux-Affinity-Installer/releases/download/Affinity-wine-10.10-Appimage/Affinity-3-x86_64.AppImage")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/Affinity.AppImage" \
        "${pkgdir}/opt/affinity/Affinity.AppImage"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/affinity/Affinity.AppImage \
        "${pkgdir}/usr/bin/affinity"

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/affinity.desktop" << EOF
[Desktop Entry]
Name=Affinity Studio
Exec=affinity
Icon=affinity
Type=Application
Categories=Graphics;
EOF
}
