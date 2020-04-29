# Maintainer: SuperITMan <admin(at)superitman(dot)com>

pkgname=chromium-keepassxc-browser
pkgver=1.6.3
pkgrel=1
pkgdesc="KeePassXC Browser Extension for Chrome / Chromium"
arch=('x86_64')
url="https://github.com/keepassxreboot/keepassxc-browser"
license=('GPL3')
makedepends=('unzip')
optdepends=("chromium: open-source web browser by Google"
            "google-chrome: The popular and trusted web browser by Google")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_chromium.zip")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=("4d063c9734fee23eb48538daaa5a012c3d506dfd02b2467dac815c0ca0474928")
extensionname="keepassxc-browser"

prepare() {
    mkdir -p "${srcdir}/${extensionname}-${pkgver}-${pkgrel}"
    unzip -o ${pkgname}-${pkgver}.zip -d "${srcdir}/${extensionname}-${pkgver}-${pkgrel}"
}

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -dr --no-preserve=ownership "${srcdir}/${extensionname}-${pkgver}-${pkgrel}"/* "${pkgdir}/usr/share/${pkgname}/"
}