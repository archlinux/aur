# Maintainer: Alastair Ozmond <alastair.ozmond@gmail.com>
pkgname=usb-tree-app-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="USB device tree viewer with detailed information and monitor (binary release)"
arch=('x86_64')
url="https://github.com/AOzmond/usb-tree"
license=('GPL-2.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'libusb')
provides=('usb-tree')
conflicts=('usb-tree' 'usb-tree-app')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/0.0.5/usb-tree-linux-amd64.tar.gz")
sha256sums=('d553e48932658566cb152746ea5a04d2a4b788e45b2b3c21c9b9c5ab4aac3fb0')

package() {
    # Install binary
    install -Dm755 "${srcdir}/usb-tree" "${pkgdir}/usr/bin/usb-tree"

    # Install desktop file
    install -Dm644 "${srcdir}/usb-tree.desktop" "${pkgdir}/usr/share/applications/usb-tree.desktop"

    # Install icon
    install -Dm644 "${srcdir}/usb-tree.png" "${pkgdir}/usr/share/pixmaps/usb-tree.png"

    # Also install icon in hicolor theme (standard location)
    install -Dm644 "${srcdir}/usb-tree.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/usb-tree.png"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
