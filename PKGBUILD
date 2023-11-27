# Maintainer: Michael Cooper <mythmon at gmail dot com>
pkgname=zsa-keymapp-bin
_pkgname=keymapp
pkgver=1.0.6
pkgrel=1
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
sha256sums=('a2781ab89b8700682bcf2137f45cf9a15b8747efc7a22fe6579190a23b3202ae'
            '2dab50a9b558b6d3f8c6f59ad3b9aa584717f093faf546179cd3587ba41d1e20'
            '0eeef059153ccc07f1f16ae74d5ab9b55bdac0119639a9576f1677164cb86231')

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
