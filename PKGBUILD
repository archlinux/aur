# Maintainer: newtalan <newtalan@gmail.com>

pkgname='gui-for-clash'
_pkgname='GUI.for.Clash'
pkgver='1.15.1'
pkgrel='1'
pkgdesc='GUI for Clash'
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
    "https://cdn.jsdelivr.net/gh/GUI-for-Cores/${_pkgname}@main/build/appicon.png"
    "${pkgname}.install"
)

sha256sums=('d4983c0e0e6cca1508562a36632ca5af9aea5d10c2c87d28d011196d803c1f80'
            'aec5e2cc7c4fe3885fc57258f52100de8716fa8b93c8e9e0d62cc976c78f0502'
            '8933f6159cb5de8bd623eefc0a82ebeab50c9633a4fee87ac2f30054938ff8a4'
            '9f7062c9f445d26b677bb875e17b832845856882d41f53d83789960c33539ee6')

package() {
    msg "make ${pkgname} package"

    install -Dm755 "${_pkgname}" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 *.png ${pkgdir}/opt/${pkgname}/icon/${pkgname}.png
    install -Dm644 *.desktop -t ${pkgdir}/usr/share/applications
}
