# Maintainer: Alastair Ozmond <alastair.ozmond@gmail.com>
pkgname=usb-tree-app-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="USB device tree viewer with detailed information (binary release)"
arch=('x86_64')
url="https://github.com/AOzmond/usb-tree"
license=('GPL-2.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'libusb')
provides=('usb-tree')
conflicts=('usb-tree' 'usb-tree-app')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/0.0.1/usb-tree-linux-amd64.tar.gz")
sha256sums=('4bf9b8f4666c3744acf6da66bb1cc890115128b113df99f77f7599019d19efde')

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
