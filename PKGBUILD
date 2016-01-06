# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# BlackMagic's DeckLink SDK
# You need to download the SDK file from BlackMagic's website. (registration required)
# Look for a file called "Desktop Video <version> SDK".
# Download website:
# https://www.blackmagicdesign.com/support

pkgname=blackmagic-decklink-sdk
pkgver=10.5.4
_cintelsdkver="$pkgver"a4
pkgrel=1
pkgdesc="BlackMagic's DeckLink SDK"
arch=('any')
url="https://www.blackmagicdesign.com/support/"
license=('custom')
provides=('decklink-sdk')
conflicts=('decklink-sdk')
source=("file://Blackmagic_DeckLink_SDK_${pkgver}.zip"
        "LICENSE")
sha256sums=('d734024c16593f335c3a6d7caa442b27c554425ce9d407a6fbfd9cc6badd75f8'
            'cc90e53ac2ef2442d2d0adfe9214119baa31ec080e75c3b087365efdbccc23df')

package() {
	cd "${srcdir}/CintelSDK-${_cintelsdkver}/Linux/include"
	
	mkdir -p "${pkgdir}"/usr/include
	
	install -D -m644 * "${pkgdir}"/usr/include
	install -D -m644 "$srcdir"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
