# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=('otf-yrsa' 'ttf-yrsa')
pkgbase=yrsa-font
pkgver=2.002
pkgrel=1
pkgdesc='Serif font for continuous reading on the web'
arch=(any)
url="https://github.com/rosettatype/yrsa-rasa"
license=('OFL')
groups=('yrsa-rasa-fonts')
source=("$pkgbase-$pkgver.zip::$url/releases/download/v$pkgver/Yrsa-fonts-v$pkgver.zip")
sha256sums=('9ad48d317fcff8fe1fb28f346a6798de9e4a163439d34aac07a5b02d6d64b203')

_package() {
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

	# txt file is actually a Markdown file:
	install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.md"
}

package_otf-yrsa() {
	conflicts=('ttf-yrsa')
	_package
	install -Dm644 -t "$pkgdir/usr/share/fonts/${pkgbase%-font}" otf/*.otf
}

package_ttf-yrsa() {
	conflicts=('otf-yrsa')
	_package
	install -Dm644 -t "$pkgdir/usr/share/fonts/${pkgbase%-font}" ttf/*.ttf
}
