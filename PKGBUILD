# Maintainer: John Fitch <john@johnzfitch.com>
pkgname=docs-browser
pkgver=1.0.0
pkgrel=1
pkgdesc="Unified documentation browser with Walker integration for Hyprland desktops"
arch=('any')
url="https://github.com/johnzfitch/docs-browser"
license=('MIT')
depends=('bash' 'walker' 'wl-clipboard')
optdepends=(
    'bat: syntax-highlighted preview'
    'ghostty: default terminal emulator'
    'hyprland: window tagging support'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${pkgname}-${pkgver}"

    # Install the script
    install -Dm755 docs-browser "${pkgdir}/usr/bin/docs-browser"

    # Install documentation wikis
    install -dm755 "${pkgdir}/usr/share/docs-browser/wikis"
    cp -r wikis/* "${pkgdir}/usr/share/docs-browser/wikis/"

    # Install icons
    install -dm755 "${pkgdir}/usr/share/docs-browser/icons"
    cp -r icons/* "${pkgdir}/usr/share/docs-browser/icons/"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
