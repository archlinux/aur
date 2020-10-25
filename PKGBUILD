pkgname=wikitaxi
pkgver=1.3.0
pkgrel=2
pkgdesc="browse MediaWiki files offline"
arch=('x86_64')
license=('unknown')
source=("https://www.yunqa.de/delphi/downloads/WikiTaxi_$pkgver.zip" "wikitaxi" "wikitaxi_importer" "wikitaxi.desktop" "wikitaxi.png")
options=(!strip)
depends=('wine')
sha512sums=('985d613606e87a59a4ac170ee923a559c31a0ff0a478935f1a98655ce3658977bce49b864d0ac801ab01c63459c389a24274b4eb060761d0ec0e89d57525bba3'
            '5bb0312acdf0908e08046b4518ce8423e1bf07a98589f79e2e6354467bdb39df37e08306bd9e918faa926081db2bb0eafee175cd3f18f94ee2458905a46704c5'
            '93ac8f15d927e5f53c50e1ef6cec0cadfd19701d71a4ac219d3526afa00f124ea822a5b1b0c3e1958a663a7fb8d23488222918bc1a488c1f244907dec392510a'
            'ff7232ffcd436aab435c2ce3691473ae2a701cc11ddc1c2269b10338af0c79f22b9cd46b9d40d6ff9ad8d4c5f75b2ef34a158aab34d52f4100d5f1e9e2e28767'
            'd8becbce1507714b489d5cd3323fd526ff334efd845803a24bf92ec95ac00c11b37ce8c5f9fec999dc1935a93ade29e5e2ebebec08294152900fde50d91f5218')
package() {
	mkdir -p "$pkgdir"/usr/share/"$pkgname" "$pkgdir"/usr/bin

	cp -ra "$srcdir"/* "$pkgdir"/usr/share/"$pkgname"

	find "$pkgdir"/usr/share/"$pkgname" -type f -exec chmod -R 755 "{}" +
	find "$pkgdir"/usr/share/"$pkgname" -type l -delete

	install -Dm755 "$pkgname" "$pkgname"_importer "$pkgdir"/usr/bin
	install -Dm644 "$pkgname.png" "$pkgdir"/usr/share/icons/"$pkgname.png"
	install -Dm644 "$pkgname.desktop" "$pkgdir"/usr/share/applications/"$pkgname.desktop"
}	
