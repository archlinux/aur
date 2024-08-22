# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname='gui-for-singbox'
_pkgname='GUI.for.SingBox'
pkgver='1.8.3'
pkgrel='1'
pkgdesc='GUI for SingBox'
arch=('x86_64')

license=('GPL3')

depends=(
    'glibc'
    'webkit2gtk-4.1'
)

url="https://github.com/GUI-for-Cores/${_pkgname}"

install="${pkgname}.install"

# Bin package
source=(
    "${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip"
    "${pkgname}.desktop"
    "https://raw.githubusercontent.com/GUI-for-Cores/${_pkgname}/main/build/appicon.png"
    "${pkgname}.install"
)

sha256sums=('348a66f7236450ee68854b573c51154b0009a8c04f8742922622cb3f9a74a058'
            '576a9561c73fdc39f31670ac5cb6fefc61822a348f116f0d64f9e2e402882729'
            '08257d0d21c76a56e48e38105460927293a452ddc6b0b62db401bf5b5b9b7adf'
            '53477d98b4507c0cf9ae88f3c6b06ddb768b604dab8027ca9ac29e5e4fe46d29')

package() {
    msg "make ${pkgname} package"

    install -Dm755 "${_pkgname}" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 *.png ${pkgdir}/opt/${pkgname}/icon/${pkgname}.png
    install -Dm644 *.desktop -t ${pkgdir}/usr/share/applications
}
