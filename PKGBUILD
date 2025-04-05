# Maintainer: Michael Cooper <mythmon at gmail dot com>
pkgname=zsa-keymapp-bin
_pkgname=keymapp
pkgver=1.3.5
pkgrel=1
pkgdesc="A live visual reference for your ZSA keyboard"
arch=(x86_64)
url="https://zsa.io/flash"
license=(custom:not-provided)
depends=(libusb gtk3)
depends=(zsa-udev libusb gtk3 webkit2gtk-4.1)
# ZSA does not seem to provide a proper versioned download for keymapp, so just grab the latest one.
# If the checksum fails we know there's a new version.
source=("${pkgname}-${pkgver}.tar.gz::https://oryx.nyc3.cdn.digitaloceanspaces.com/keymapp/keymapp-latest.tar.gz"
        'keymapp.desktop')
sha256sums=('1979a642cb2bb04a6ca9f11149af19146a34afbdaab1db1b16d9a273cf9209f4'
            '798667e23dfc74f6a4c65f7ecb9838dec4987a2c4224fe9bb38e85cb2d2ad861')

package() {
    install -Dm0755 "${srcdir}/keymapp" "${pkgdir}/usr/bin/keymapp"
    install -Dm0644 -t "${pkgdir}/usr/share/applications/" "${srcdir}/keymapp.desktop" 
    install -Dm0644 "${srcdir}/icon.png"  "${pkgdir}/usr/share/pixmaps/keymapp.png"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "No license information provided" > "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
