# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=gnome-shell-extension-caffeine
pkgver=48
pkgrel=2
pkgdesc='Extension for GNOME shell to disable screensaver and auto suspend'
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL2')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8d4057c42a4a969981c2f9148e7820ea9de707b3d10f9c22da8b7e05259e9487')

build() {
    cd "${pkgname}-${pkgver}"
    make build
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/gnome-shell/extensions"
    cp -a caffeine@patapon.info/ "${pkgdir}/usr/share/gnome-shell/extensions"

    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
