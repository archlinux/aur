# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=gnome-shell-extension-caffeine
pkgver=46
pkgrel=1
pkgdesc='Extension for GNOME shell to disable screensaver and auto suspend'
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL2')
depends=('gnome-shell' 'gnome-shell-extensions')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a289f5486c5311b1edf362f292d130a196466dc17c3d3bef22312374ab2af2ef')

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
