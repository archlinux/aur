pkgname=wikitaxi
pkgver=1.3.0
pkgrel=1
pkgdesc="browse MediaWiki files offline"
arch=('x86_64')
license=('unknown')
source=("https://www.yunqa.de/delphi/downloads/WikiTaxi_$pkgver.zip" "wikitaxi" "wikitaxi_importer")
options=(!strip)
depends=('wine')
sha512sums=('985d613606e87a59a4ac170ee923a559c31a0ff0a478935f1a98655ce3658977bce49b864d0ac801ab01c63459c389a24274b4eb060761d0ec0e89d57525bba3'
            '1586a4ca1d281f32b5902dcdc281515eb61d74baab720a9008690ab318336631973ae658502aa8b5d96faf0b478ae9ac449b3d33520e30f1bbff25f2ea14cfe5'
            '139831fd6b0766578a64d5aeaa96c157563d73f20f7cdc1126e5151461572d391ad12723bbc6271a55e5d066158727edce2a02d6fd6de6c7d4c24042699149ec')
package() {
	mkdir -p "$pkgdir"/usr/share/"$pkgname" "$pkgdir"/usr/bin

	cp -ra "$srcdir"/* "$pkgdir"/usr/share/"$pkgname"

	find "$pkgdir"/usr/share/"$pkgname" -type f -exec chmod -R 755 "{}" +
	find "$pkgdir"/usr/share/"$pkgname" -type l -delete

	install -Dm755 wikitaxi wikitaxi_importer "$pkgdir"/usr/bin
}	
