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
            '5bb0312acdf0908e08046b4518ce8423e1bf07a98589f79e2e6354467bdb39df37e08306bd9e918faa926081db2bb0eafee175cd3f18f94ee2458905a46704c5'
            '93ac8f15d927e5f53c50e1ef6cec0cadfd19701d71a4ac219d3526afa00f124ea822a5b1b0c3e1958a663a7fb8d23488222918bc1a488c1f244907dec392510a')
package() {
	mkdir -p "$pkgdir"/usr/share/"$pkgname" "$pkgdir"/usr/bin

	cp -ra "$srcdir"/* "$pkgdir"/usr/share/"$pkgname"

	find "$pkgdir"/usr/share/"$pkgname" -type f -exec chmod -R 755 "{}" +
	find "$pkgdir"/usr/share/"$pkgname" -type l -delete

	install -Dm755 wikitaxi wikitaxi_importer "$pkgdir"/usr/bin
}	
