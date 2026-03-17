pkgname=servhub
pkgver=1.0.6
pkgrel=1
pkgdesc="ServHub — Custom Linux App Store"
arch=('x86_64')
url="https://github.com/B5aaR/servhub-store"
license=('MIT')
depends=('flatpak')
options=('!strip')
source=("https://github.com/B5aaR/servhub-store/releases/download/v${pkgver}/ServHub-${pkgver}.AppImage")
sha256sums=('b36c161fb87255d0cb9742ad64c0a80c5f70cf1b5f495de181fc0acd3d9ad5be')

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
