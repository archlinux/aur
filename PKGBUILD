# Maintainer: loss
pkgname=aghub-bin
pkgver=1.0.2
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
sha256sums=('a043d3539db33cd736f4b7c3f2790e07016641c42eb86f68a2319d370752fdb5'
            '4bbd7d8f6f33898175aba4e080356b6672a881338df953ed191c25b8e7358917'
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
