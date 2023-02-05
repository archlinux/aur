# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=gnome-shell-extension-caffeine
pkgver=43
pkgrel=1
pkgdesc='Extension for GNOME shell to disable screensaver and auto suspend'
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL2')
depends=('gnome-shell' 'gnome-shell-extensions')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8d3669ff8a0867937fcef94c80fdc66f54ea9e1305a39f8e8d8fafc1c52c7fba')

build() {
    cd "${pkgname}-${pkgver}"
    make build
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/gnome-shell/extensions"
    cp -a caffeine@patapon.info/ "${pkgdir}/usr/share/gnome-shell/extensions"
}
