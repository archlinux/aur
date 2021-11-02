# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=('otf-rasa' 'ttf-rasa')
pkgbase=rasa-font
pkgver=2.002
pkgrel=1
pkgdesc='Serif font for continuous reading on the web (Gujarati included)'
arch=(any)
url="https://github.com/rosettatype/yrsa-rasa"
license=('OFL')
groups=('yrsa-rasa-fonts')
source=("$pkgbase-$pkgver.zip::$url/releases/download/v$pkgver/Rasa-fonts-v$pkgver.zip")
sha256sums=('a0e340ed75d43b76cc384e66d5aee5d691f18189372e9a72c7e13988eb1c1034')

_package() {
	cd Rasa
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

	# txt file is actually a Markdown file:
	install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.md"
}

package_otf-rasa() {
	conflicts=('ttf-rasa')
	_package
	install -Dm644 -t "$pkgdir/usr/share/fonts/${pkgbase%-font}" otf/*.otf
}

package_ttf-rasa() {
	conflicts=('otf-rasa')
	_package
	install -Dm644 -t "$pkgdir/usr/share/fonts/${pkgbase%-font}" ttf/*.ttf
}
