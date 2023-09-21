# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=gnome-shell-extension-caffeine
pkgver=50
pkgrel=1
pkgdesc='Extension for GNOME shell to disable screensaver and auto suspend'
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL2')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ff4a3e938165e032e04a28d4430a85eec3f5c4c9ae0000dc24a2cc4e16da980a')

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
