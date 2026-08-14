# Maintainer: Lukash <lukash at aur dot archlinux dot org>
pkgname=dmtl-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Custom Linux launcher for DayZ"
arch=('x86_64')
url="https://github.com/69-Lukash/DMTLauncher"
license=('MIT')
provides=('dmtl')
conflicts=('dmtl')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/69-Lukash/DMTLauncher/releases/download/v${pkgver}/DMTL-Linux.tar.gz")
sha256sums=('b17a494d8c510307b9cf8e5d8bf6f912b2743a95ee776dab6ab264a7ef07421b')

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
