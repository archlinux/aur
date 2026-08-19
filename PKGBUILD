# Maintainer: Lukash <lukash at aur dot archlinux dot org>
pkgname=dmtl-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="Custom Linux launcher for DayZ"
arch=('x86_64')
url="https://github.com/69-Lukash/DMTLauncher"
license=('MIT')
provides=('dmtl')
conflicts=('dmtl')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/69-Lukash/DMTLauncher/releases/download/v${pkgver}/DMTL-Linux.tar.gz")
sha256sums=('80005e9f66259175be13f91460015020c243115c4a9dc285005f4f7e06a62f0a')

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
