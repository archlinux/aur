# Maintainer: Seraph_JACK <seraphjack@outlook.com>
pkgname=annix-bin
pkgver=nightly
pkgrel=2
pkgdesc="Music player for Project Anni. (Binary version)"
arch=('x86_64')
url="https://github.com/ProjectAnni/annix"
license=('Apache')
provides=("annix")
conflicts=("annix")

source=(annix-${pkgver}.zip::https://github.com/ProjectAnni/annix/releases/download/nightly/annix-linux64.zip
        annix
        annix.png
        annix.desktop)

sha256sums=('SKIP'
            'f13828a077bbd1a3330e79b46367d9789c15025fdd4a2c0b44fca9b4da7907cc'
            '45d6cbfb1a232910c8c725b4242458e96058dd8c6d3eb7e1511b56909e1faaa1'
            'e333918cd90c719ba39cd8d4e8d659c90237ca22fa5633829c99f4d5b6f4c2d7')

package() {
    # Libraries
    mkdir -p "${pkgdir}/usr/lib/annix"
    cp -r "${srcdir}/bundle" "${pkgdir}/usr/lib/annix/"

    # Binaries
    install -D -m755 "${srcdir}/annix" "${pkgdir}/usr/bin/annix"

    # Desktop launcher with icon
    install -Dm644 "${srcdir}/annix.desktop" "${pkgdir}/usr/share/applications/annix.desktop"
    install -Dm644 "${srcdir}/annix.png" "${pkgdir}/usr/share/pixmaps/annix.png"
}
