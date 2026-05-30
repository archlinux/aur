# Maintainer: loss
pkgname=aghub-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="One hub for every AI coding agent - unified configuration management for 22+ assistants"
arch=('x86_64')
url="https://github.com/AkaraChen/aghub"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('aghub' 'aghub-cli')
conflicts=('aghub')
options=('!strip' '!debug')
source=("https://github.com/AkaraChen/aghub/releases/download/v${pkgver}/aghub_${pkgver}_amd64.deb"
        "https://github.com/AkaraChen/aghub/releases/download/v${pkgver}/aghub-cli-x86_64-unknown-linux-gnu.tar.gz"
        "aghub.desktop")
sha256sums=('533a1b4f826d96cd53e37c4aaf5aaf6e34cb01bb24047335ce7045842a4e6768'
            '2931cc70d04df89dc26f28421cb388465f43cac1578d3f2761bdae38a4c6d1b3'
            'c757f3e63c64ac773c4693804e5710b66d280ea7e07eafa3a0ef384245a4375c')

package() {
    cd "${srcdir}"

    # Extract deb data
    bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}/"

    # CLI
    install -Dm755 aghub-cli -t "${pkgdir}/usr/bin/"

    # Desktop entry
    install -Dm644 aghub.desktop "${pkgdir}/usr/share/applications/aghub.desktop"
}
