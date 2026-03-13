# Maintainer: Dmitrij Vinokour <vinokour.dmitrij@gmail.com>
pkgname=tcg-lightning-bin
pkgver=0.1.34
pkgrel=1
pkgdesc="Magic: The Gathering deck building app with Scryfall, EDHREC, Archidekt, Commander Spellbook support and AI-powered suggestions"
arch=('x86_64')
url="https://github.com/Dimfred/tcg-lightning"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('tcg-lightning')
conflicts=('tcg-lightning')
source=("${pkgname}-${pkgver}.deb::https://github.com/Dimfred/tcg-lightning/releases/download/v${pkgver}/linux-tcg-lightning_${pkgver}_amd64.deb")
sha256sums=('1ecb42fdbe71fc70adddc73d34b5501cd7d892224c9981f893ec4f5bb0934de9')

package() {
    # Extract the .deb package
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    # Fix permissions
    chmod 755 "${pkgdir}/usr/bin/tcg-lightning"
}
