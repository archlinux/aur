# Maintainer: Michael Cooper <mythmon at gmail dot com>
pkgname=zsa-keymapp-bin
_pkgname=keymapp
pkgver=1.0.5
pkgrel=2
pkgdesc="A live visual reference for your ZSA keyboard"
arch=(x86_64)
url="https://zsa.io/flash"
license=(custom:not-provided)
depends=(libusb gtk3)
depends=(zsa-udev libusb gtk3 webkit2gtk)
source=("https://oryx.nyc3.cdn.digitaloceanspaces.com/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "keymapp.desktop"
        "keymapp.png")
provides=()
conflicts=()
sha256sums=('7bd4f2de031bfa791718af2c343e258f2ac8c4ffb57cb6ac895e83a138969ac5'
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
