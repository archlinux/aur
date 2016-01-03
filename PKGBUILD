# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# BlackMagic's DeckLink SDK
# You need to download the SDK file from BlackMagic's website. (registration required)
# Look for a file called "Desktop Video <version> SDK".
# Download website:
# https://www.blackmagicdesign.com/support

pkgname=blackmagic-decklink-sdk
pkgver=10.5.3
_cintelsdkver="$pkgver"a6
pkgrel=1
pkgdesc="BlackMagic's DeckLink SDK"
arch=('any')
url="https://www.blackmagicdesign.com/support/"
license=('custom')
provides=('decklink-sdk')
conflicts=('decklink-sdk')
source=("file://Blackmagic_DeckLink_SDK_${pkgver}.zip"
        "LICENSE")
sha256sums=('49875e0b0b82a18c3b54ee144546c0df9d9dff6d36ec6d2a0d73cecbbe252984'
            'cc90e53ac2ef2442d2d0adfe9214119baa31ec080e75c3b087365efdbccc23df')

package() {
	cd "${srcdir}/CintelSDK-${_cintelsdkver}/Linux/include"
	
	mkdir -p "${pkgdir}"/usr/include
	
	install -D -m644 * "${pkgdir}"/usr/include
	install -D -m644 "$srcdir"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
