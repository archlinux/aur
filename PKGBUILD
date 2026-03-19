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
sha256sums=('37b179dbf3627c87367942f7ad014467c24be54283385811e16ad7b711afaded')

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
