pkgname=servhub
pkgver=1.0.4
pkgrel=1
pkgdesc="ServHub — Custom Linux App Store"
arch=('x86_64')
url="https://github.com/B5aaR/servhub-store"
license=('MIT')
depends=('flatpak')
options=('!strip')
source=("https://github.com/B5aaR/servhub-store/releases/download/v${pkgver}/ServHub-${pkgver}.AppImage")
sha256sums=('b0f45edeebab7c5dd5222fb0b0cec0ac15df5d23a4d42770a89433033943f4c9')

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
