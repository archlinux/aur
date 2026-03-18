pkgname=servhub
pkgver=1.0.7
pkgrel=1
pkgdesc="ServHub — Custom Linux App Store"
arch=('x86_64')
url="https://github.com/B5aaR/servhub-store"
license=('MIT')
depends=('flatpak')
options=('!strip')
source=("https://github.com/B5aaR/servhub-store/releases/download/v${pkgver}/ServHub-${pkgver}.AppImage")
sha256sums=('10d9651a8d19d29b199b2db007b41e1b87a4212d21c2f163907b43527d14f952')

package() {
    # Install the AppImage as a global system command
    install -Dm755 "${srcdir}/ServHub-${pkgver}.AppImage" "${pkgdir}/usr/bin/servhub"

    # Automatically generate the App Menu icon file
    install -dm755 "${pkgdir}/usr/share/applications"
    echo "[Desktop Entry]
Name=ServHub
Comment=My Private App Store
Exec=/usr/bin/servhub
Icon=system-software-install
Type=Application
Categories=System;Utility;
Terminal=false" > "${pkgdir}/usr/share/applications/servhub.desktop"
}
