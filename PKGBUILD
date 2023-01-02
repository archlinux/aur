# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=gnome-shell-extension-caffeine
pkgver=42
pkgrel=2
pkgdesc='Extension for GNOME shell to disable screensaver and auto suspend'
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL2')
depends=('gnome-shell' 'gnome-shell-extensions')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6c62ab77ef8b5ad8b219b0ff47557f9375f9fc62046767fc76705620c3177e04')

build() {
    cd "${pkgname}-${pkgver}"
    make build
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/gnome-shell/extensions"
    cp -a caffeine@patapon.info/ "${pkgdir}/usr/share/gnome-shell/extensions"
}
