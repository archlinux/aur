# Maintainer: TunarJamalov <jamalovtunar@gmail.com>
pkgname=pomofocus-bin
pkgver=1.0.1
pkgrel=3
pkgdesc="Pomo - Focus & Productivity Companion for Arch Linux"
arch=('x86_64')
url="https://pomofocus.online"
license=('ISC')
depends=('gtk3' 'libxss' 'nss' 'libdbusmenu-gtk3' 'alsa-lib')
provides=('pomofocus')
conflicts=('pomofocus')

source=("https://pomofocus.online/PomoFocus-1.0.1.AppImage"
        "https://pomofocus.online/logo.png")
sha256sums=('006c565c5d414c6679260e15e4e902dedc80e3d1ec0ecdec0f709e4c02877522'
            'SKIP')

package() {
    install -Dm755 "${srcdir}/PomoFocus-1.0.1.AppImage" "${pkgdir}/usr/bin/pomofocus"
    install -Dm644 "${srcdir}/logo.png" "${pkgdir}/usr/share/pixmaps/pomofocus.png"
    mkdir -p "${pkgdir}/usr/share/applications"
    cat <<EOT > "${pkgdir}/usr/share/applications/pomofocus.desktop"
[Desktop Entry]
Name=Pomo Focus
Exec=/usr/bin/pomofocus
Icon=pomofocus
Type=Application
Categories=Office;Utility;
Comment=Focus & Productivity Companion
EOT
}
