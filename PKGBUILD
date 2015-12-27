# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# BlackMagic's DeckLink SDK
# You need to download the SDK file from BlackMagic's website. (registration required)
# Look for a file called "Desktop Video <version> SDK".
# Download website:
# https://www.blackmagicdesign.com/support

pkgname=blackmagic-decklink-sdk
pkgver=10.5.2
pkgrel=1
pkgdesc="BlackMagic's DeckLink SDK"
arch=('any')
url="https://www.blackmagicdesign.com/support/"
license=('custom')
provides=('decklink-sdk')
conflicts=('decklink-sdk')
source=("file://Blackmagic_DeckLink_SDK_${pkgver}.zip"
        "LICENSE")
sha256sums=('245c3ba64055163cbe06abb45c9a1facb7e7a7b58a9042af7ee3208b9e6e6e22'
            'cc90e53ac2ef2442d2d0adfe9214119baa31ec080e75c3b087365efdbccc23df')

package() {
	cd "$srcdir/Blackmagic DeckLink SDK $pkgver/Linux/include"
	
	mkdir -p "${pkgdir}"/usr/include
	
	install -D -m644 * "${pkgdir}"/usr/include
	install -D -m644 "$srcdir"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
