# Maintainer: Víctor Hugo Sosa Esquivel <arch@victorsosa.com>
pkgname=vsfetch-settings
pkgver=1.0
pkgrel=1
pkgdesc="Graphical settings editor for vsFetch — GTK3 config manager with live preview and theme tools"
arch=('any')
url="https://github.com/victorsosaMx/vsFetch-Settings"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
    'gtk3'
)
optdepends=(
    'vsfetch: for live preview'
    'matugen: palette generation from image or color'
    'ttf-jetbrains-mono-nerd: icons in labels'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/victorsosaMx/vsFetch-Settings/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('be09138bc74250b9907b4d6a1ff438c43e2337205e77936583e54ed9bc42abaf')

package() {
    cd "vsFetch-Settings-${pkgver}"
    install -Dm755 vsfetch-settings               "${pkgdir}/usr/bin/vsfetch-settings"
    install -Dm644 LICENSE                        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md                      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
