# Maintainer: Víctor Hugo Sosa Esquivel <arch@victorsosa.com>
pkgname=vsfetch
pkgver=2.0
pkgrel=1
pkgdesc="Graphical GTK3 system info panel for Linux — themes, animations, multi-distro"
arch=('any')
url="https://github.com/victorsosaMx/vsFetch"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
    'gtk3'
    'papirus-icon-theme'
    'ttf-jetbrains-mono-nerd'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/victorsosaMx/vsFetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

package() {
    cd "vsFetch-${pkgver}"
    install -Dm755 vsfetch                    "${pkgdir}/usr/bin/vsfetch"
    install -Dm644 LICENSE                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md                  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 config.json                "${pkgdir}/usr/share/doc/${pkgname}/config.json.example"
    for f in themes/*.json; do
        install -Dm644 "$f"                   "${pkgdir}/usr/share/doc/${pkgname}/${f}"
    done
}
