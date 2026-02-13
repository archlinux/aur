# Maintainer: Dmitrij Vinokour <vinokour.dmitrij@gmail.com>
pkgname=tcg-lightning-bin
pkgver=0.1.21
pkgrel=1
pkgdesc="Magic: The Gathering deck building app with Scryfall, EDHREC, Archidekt, Commander Spellbook support and AI-powered suggestions"
arch=('x86_64')
url="https://github.com/Dimfred/tcg-lightning"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('tcg-lightning')
conflicts=('tcg-lightning')
source=("${pkgname}-${pkgver}.deb::https://github.com/Dimfred/tcg-lightning/releases/download/v${pkgver}/linux-tcg-lightning_${pkgver}_amd64.deb")
sha256sums=('292f88dca7ba5c96b2a7c6f9ece88a48397f0421da5ee8ca782fd70e39da0999')

package() {
    # Extract the .deb package
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    # Fix permissions
    chmod 755 "${pkgdir}/usr/bin/tcg-lightning"
}
