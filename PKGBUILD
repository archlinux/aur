# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# Blackmagic's DeckLink SDK
# You need to download the SDK file from Blackmagic's website. (registration required)
# Look for a file called "Desktop Video <version> SDK".
# Download website:
# https://www.blackmagicdesign.com/support

pkgname=blackmagic-decklink-sdk
pkgver=10.6.6
pkgrel=1
pkgdesc="Blackmagic's DeckLink SDK (need to register and download from upstream URL)"
arch=('any')
url="https://www.blackmagicdesign.com/support/"
license=('custom')
provides=('decklink-sdk')
conflicts=('decklink-sdk')
source=("file://Blackmagic_DeckLink_SDK_${pkgver}.zip"
        "LICENSE")
sha256sums=('4514a95778f94dedd8768f1306557b551a15f2464ec8fa69165356d12d70e410'
            'cc90e53ac2ef2442d2d0adfe9214119baa31ec080e75c3b087365efdbccc23df')

package() {
	cd "${srcdir}/Blackmagic DeckLink SDK ${pkgver}/Linux/include"
	
	mkdir -p "${pkgdir}"/usr/include
	
	install -D -m644 * "${pkgdir}"/usr/include
	install -D -m644 "$srcdir"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
