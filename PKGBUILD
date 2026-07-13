# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname='gui-for-singbox'
_pkgname='GUI.for.SingBox'
pkgver='1.25.4'
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
    "${url}/releases/download/v${pkgver}/GUI.for.SingBox-linux-amd64.zip"
    "${pkgname}.desktop"
    "https://raw.githubusercontent.com/GUI-for-Cores/${_pkgname}/main/build/appicon.png"
    "${pkgname}.install"
)

sha256sums=('cf2367cb5203c583b4683187cde597e5bd7f9f2e55b08f9f2ba98c422c5bb793'
            '576a9561c73fdc39f31670ac5cb6fefc61822a348f116f0d64f9e2e402882729'
            '08257d0d21c76a56e48e38105460927293a452ddc6b0b62db401bf5b5b9b7adf'
            'deb546a178a9ff9127f8ffa604d2c4c0d1a2d1b8114eb5edc8e8e26f1d365673')

package() {
    msg "make ${pkgname} package"

    install -Dm755 "${_pkgname}" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 *.png ${pkgdir}/opt/${pkgname}/icon/${pkgname}.png
    install -Dm644 *.desktop -t ${pkgdir}/usr/share/applications
}
