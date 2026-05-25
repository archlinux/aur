# Maintainer: Lukash <lukash at aur dot archlinux dot org>
pkgname=dmtl-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="Custom Linux launcher for DayZ"
arch=('x86_64')
url="https://github.com/69-Lukash/DMTLauncher"
license=('MIT')
provides=('dmtl')
conflicts=('dmtl')
options=('!strip' '!debug')
source=("https://github.com/69-Lukash/DMTLauncher/releases/download/v${pkgver}/DMTL-Linux.tar.gz")
sha256sums=('8943713999baa2f4a6534d3f825a7c66e77074c9ef65173e34798831166dce3c')

package() {
    install -d "$pkgdir/opt/dmtl"
    cp -r "$srcdir/DMTL-Linux/"* "$pkgdir/opt/dmtl/"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/dmtl/DMTL-Linux "$pkgdir/usr/bin/dmtl"

    install -d "$pkgdir/usr/share/applications"
    echo "[Desktop Entry]
Name=DMTL
Comment=DayZ MefTeam Launcher
Exec=dmtl
Icon=dmtl
Terminal=false
Type=Application
Categories=Game;" > "$pkgdir/usr/share/applications/dmtl.desktop"

    install -d "$pkgdir/usr/share/pixmaps"
    cp "$srcdir/DMTL-Linux/_internal/assets/icon.png" "$pkgdir/usr/share/pixmaps/dmtl.png"
}
