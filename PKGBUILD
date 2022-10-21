# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributer: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=inky
pkgver=0.14.1
pkgrel=1
pkgdesc="Editor for ink: inkle's narrative scripting language"
arch=('x86_64')
url="http://www.inklestudios.com/ink"
license=('MIT')
options=('!strip')
depends=('icu68')
optdepends=('mono: for exporting to web and JSON')
source=("${pkgname}-${pkgver}.zip::https://github.com/inkle/inky/releases/download/${pkgver}/Inky_linux.zip"
        "${pkgname}-${pkgver}.png::https://github.com/inkle/inky/raw/${pkgver}/resources/Icon1024.png"
        "${pkgname}.desktop")
sha512sums=('709cb33370c9fe47b256095ece033b9ba4e8fa0777f9504f6b133655337ac12642b98145d7f33be74cba0280cd226f27539665683cdb1e738ec90a8154705a4f'
            '4f465c45c1c61ede58db0a36682f575b7d755c9c28b0261a7892045813986d12f77d3d5c8881d9c476e07ca5169ed163c89f56a8a4049c6f0337db6cab3275e5'
            '84fd0f87bfdf5e1fd6df5f9e253e3aa71373b9ad28a1d027522eceb6cf94a9a370ef239bfe0738ce64efabb3685945fc40c054265418b0a639e26e4213211481')

package() {
    install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${pkgname}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -d -m755 "${pkgdir}/usr/share/${pkgname}"

    cd "Inky-linux-x64"

    cp -a -r * "${pkgdir}/usr/share/${pkgname}"

    install -D -m755 Inky "${pkgdir}/usr/share/${pkgname}/Inky"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/Inky" "${pkgdir}/usr/bin/${pkgname}"
}
