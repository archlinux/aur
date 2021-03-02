# Maintainer: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=inky
pkgver=0.12.0
pkgrel=1
pkgdesc="Editor for ink: inkle's narrative scripting language"
arch=('x86_64')
url="http://www.inklestudios.com/ink"
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://github.com/inkle/inky/releases/download/${pkgver}/Inky_linux.zip"
        "${pkgname}-${pkgver}.png::https://github.com/inkle/inky/raw/${pkgver}/resources/Icon1024.png"
        "${pkgname}.desktop")
sha512sums=('4e0df08651f3575f6c93afc06cbf8e491af472641705d1b793aca451bf0fc8ab03ddeb50261f367705a5c7d499fd853e3c07bb1b8e71964235846e01fa23b4b3'
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
