# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=('otf-rasa' 'ttf-rasa')
pkgbase=rasa-font
pkgver=2.004
pkgrel=1
pkgdesc='Serif font for continuous reading on the web (Gujarati included)'
arch=(any)
url="https://github.com/rosettatype/yrsa-rasa"
license=('OFL')
groups=('yrsa-rasa-fonts')
source=("$pkgbase-$pkgver.zip::$url/releases/download/v$pkgver/Rasa-fonts-v$pkgver.zip")
sha256sums=('8c8fe9f7c4a0ba9fdf177e80c8e138605bbdf4cc0ea3102fe8039c345433d4c8')

_package() {
	cd "Rasa-fonts-v$pkgver"
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
