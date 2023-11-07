# Maintainer: Michael Cooper <mythmon at gmail dot com>
pkgname=zsa-keymapp-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="A live visual reference for your ZSA keyboard"
arch=(x86_64)
url="https://zsa.io/flash"
license=(custom:not-provided)
depends=(libusb gtk3)
depends=(zsa-udev libusb gtk3 webkit2gtk)
source=("https://oryx.nyc3.cdn.digitaloceanspaces.com/keymapp/keymapp-latest.tar.gz"
        "keymapp.desktop"
        "keymapp.png")
provides=()
conflicts=()
sha256sums=('523ec935356aab8210123f37f6fc5f863110aa6ac5e0344f0665704c741e0613'
            'SKIP'
            'SKIP')

prepare() {
    chmod +x "${srcdir}/keymapp"
}

package() {
    install -Dm 755 "${srcdir}/keymapp" "${pkgdir}/usr/bin/keymapp"
    install -Dm 644 "${srcdir}/keymapp.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm 644 "${srcdir}/keymapp.png" -t "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "No license information provided" > "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
