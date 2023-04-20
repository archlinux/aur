# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=gnome-shell-extension-caffeine
pkgver=47
pkgrel=1
pkgdesc='Extension for GNOME shell to disable screensaver and auto suspend'
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL2')
depends=('gnome-shell' 'gnome-shell-extensions')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('97597eaec66e7b350ad8fe3b0ff1471b5cd9d0425c14284914a341dd33e318f8')

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
