pkgname=servhub
pkgver=1.0.3
pkgrel=1
pkgdesc="ServHub — Custom Linux App Store"
arch=('x86_64')
url="https://github.com/B5aaR/servhub-store"
license=('MIT')
depends=('flatpak')
options=('!strip')
source=("https://github.com/B5aaR/servhub-store/releases/download/v${pkgver}/ServHub-${pkgver}.AppImage")
sha256sums=('a76acab749d7db052806dd593f69585184404b0ef4ff434a06050230f64a3f51')

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
