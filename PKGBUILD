# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=itext-rups-bin
_pkgname=itext-rups
pkgver=7.1.14
pkgrel=1
pkgdesc='iText RUPS is a tool to view PDF structure in a Swing GUI.'
arch=('any')
url='https://github.com/MitMaro/git-interactive-rebase-tool'
license=('GPL3')
depends=('java-environment')
makedepends=('imagemagick')
sha256sums=('c9b4e4c2b77b89c1e01354d059ea6abf0ea34fff0b33ad50d349ad875cb93d6a'
            'c213befd1132bebcbc588a7ef52c0089682767618317bd09128668d3550218b3'
            'caad8b5f70ac5889cf9df8ec181fb1bb7921c1a233b6313ef428933f4c3f810a'
            '8cb4cb1758ff4986caf8fa111f992b07d9572105cb47ec9c98dbda5926beb5a6')
source=(
    "itext-rups.sh"
    "itext-rups.desktop"
    "https://github.com/itext/i7j-rups/releases/download/${pkgver}/iText7-RUPS-${pkgver}-only-jars.zip"
    "itext-rups.svg::https://itextpdf.com/sites/default/files/2018-11/iText%205%20Product%20software%20-%20icons_57x45px_V2_iText%20RUPS.svg"
)

build() {
    convert -resize 48x48 itext-rups.svg itext-rups.png
}

package() {
    cd "$srcdir"

    install -Dm755 itext-rups.sh "${pkgdir}/usr/bin/itext-rups"
    install -Dm644 "itext-rups-${pkgver}.jar" "${pkgdir}/usr/share/java/itext-rups/itext-rups.jar"
    install -Dm644 "itext-rups.desktop" "${pkgdir}/usr/share/applications/itext-rups.desktop"
    install -Dm644 "itext-rups.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/itext-rups.png"
    install -Dm644 "itext-rups.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/itext-rups.svg"
}
