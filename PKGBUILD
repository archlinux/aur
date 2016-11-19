# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# Blackmagic's DeckLink SDK
# You need to download the SDK file from Blackmagic's website. (registration required)
# Look for a file called "Desktop Video <version> SDK".
# Download website:
# https://www.blackmagicdesign.com/support

pkgname=blackmagic-decklink-sdk
pkgver=10.8.3
pkgrel=1
pkgdesc="Blackmagic's DeckLink SDK (needs registration at upstream URL and manual download)"
arch=('any')
url="https://www.blackmagicdesign.com/support/"
license=('custom')
provides=('decklink-sdk')
conflicts=('decklink-sdk')
source=("file://Blackmagic_DeckLink_SDK_${pkgver}.zip"
        "LICENSE")
sha256sums=('be6e582c878ce6abc7faa03085d1715b45d83c2cc4e7717b0f05cf01dffb8445'
            'cc90e53ac2ef2442d2d0adfe9214119baa31ec080e75c3b087365efdbccc23df')

package() {
	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
	
	# Includes
	cd "${srcdir}/Blackmagic DeckLink SDK ${pkgver}/Linux/include"
	install -D -m644 * "${pkgdir}"/usr/include
	
	# Documentation
	cd "${srcdir}/Blackmagic DeckLink SDK ${pkgver}"
	install -D -m644 *.pdf "${pkgdir}/usr/share/doc/${pkgname}"
	
	# License
	install -D -m644 "$srcdir"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
