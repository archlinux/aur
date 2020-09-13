# Maintainer: vscncls <lucaslou4 at protonmail dot com>

pkgname=insomnia-designer
pkgver=2020.4.0
pkgrel=1
pkgdesc="The Collaborative API Design Tool for designing and managing OpenAPI specs."
url="https://github.com/Kong/insomnia"
arch=('x86_64')
license=('MIT')
provides=($pkgname)
source=(
    "${url}/releases/download/designer@${pkgver}/Insomnia.Designer-${pkgver}.tar.gz"
    "${pkgname}.desktop"
    "${pkgname}.sh"
)
md5sums=('1d1c5fd2ecbc3bef9e6b42c6fbffde9b'
         '26e57edbdf39489ce81a28aa9d6733d0'
         'de6d951fac16307b6c59f685ba1704ac')

package() {
        BUILD_DIR="Insomnia.Designer-${pkgver}"

        mkdir "${pkgdir}/usr/share/" -p
        \cp -r "${BUILD_DIR}" "${pkgdir}/usr/share/${pkgname}"
        chmod +x "${pkgdir}/usr/share/${pkgname}"

        install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
        install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

        install -Dm644 "${BUILD_DIR}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
        install -Dm644 "${BUILD_DIR}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
        install -Dm644 "${BUILD_DIR}/resources/opensource-licenses.txt" "${pkgdir}/usr/share/licenses/${pkgname}/opensource-licenses.txt"
}
