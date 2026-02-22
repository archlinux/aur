# Maintainer: Dmitrij Vinokour <vinokour.dmitrij@gmail.com>
pkgname=tcg-lightning-bin
pkgver=0.1.32
pkgrel=1
pkgdesc="Magic: The Gathering deck building app with Scryfall, EDHREC, Archidekt, Commander Spellbook support and AI-powered suggestions"
arch=('x86_64')
url="https://github.com/Dimfred/tcg-lightning"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('tcg-lightning')
conflicts=('tcg-lightning')
source=("${pkgname}-${pkgver}.deb::https://github.com/Dimfred/tcg-lightning/releases/download/v${pkgver}/linux-tcg-lightning_${pkgver}_amd64.deb")
sha256sums=('882191144a299c5d0138e2b2e3194d184a2b98fa0c078981b1c9a9a4e0a17090')

package() {
    # Extract the .deb package
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    # Fix permissions
    chmod 755 "${pkgdir}/usr/bin/tcg-lightning"
}
