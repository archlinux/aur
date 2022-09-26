# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=gnome-shell-extension-caffeine
pkgver=41
pkgrel=1
pkgdesc='Extension for GNOME shell to disable screensaver and auto suspend'
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL2')
depends=('gnome-shell' 'gnome-shell-extensions')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('03a51753f9633305d8d877ad8011b353dff5fce9cd656ce3247e9d87d4c8e202')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/gnome-shell/extensions"
    cp -a caffeine@patapon.info/ "${pkgdir}/usr/share/gnome-shell/extensions"
}
