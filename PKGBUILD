# Maintainer: SuperITMan <admin(at)superitman(dot)com>

pkgname=chromium-keepassxc-browser
pkgver=1.7.12
pkgrel=1
pkgdesc="KeePassXC Browser Extension for Chrome / Chromium"
arch=('x86_64')
url="https://github.com/keepassxreboot/keepassxc-browser"
license=('GPL3')
makedepends=('unzip')
optdepends=("chromium: open-source web browser by Google"
            "google-chrome: The popular and trusted web browser by Google"
            "keepassxc: cross-platform community-driven port of the Windows application 'Keepass Password Safe'")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_chromium.zip")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=("c6915187c9277e5b4709f707276f761e2ac39c72d9caa1c1ad555812ee90996a")
extensionname="keepassxc-browser"

prepare() {
    mkdir -p "${srcdir}/${extensionname}-${pkgver}-${pkgrel}"
    unzip -o ${pkgname}-${pkgver}.zip -d "${srcdir}/${extensionname}-${pkgver}-${pkgrel}"
}

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -dr --no-preserve=ownership "${srcdir}/${extensionname}-${pkgver}-${pkgrel}"/* "${pkgdir}/usr/share/${pkgname}/"
}
