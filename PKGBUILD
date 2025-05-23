# Contributor: Gabriel Moura <develop@srmoura.com.br>
# Maintainer: Bink <B-Interactive@users.noreply.github.com>

pkgname=bibleanalyzer
pkgver=5.6.5
pkgrel=1
pkgdesc="Bible Analyzer - A FREE Bible Study Solution"
arch=("any")
url="http://www.bibleanalyzer.com"
license=('Custon:bibleanalyzer')
depends=("python" "python-wxpython" "python-mutagen" "python-lxml" "python-configobj" "python-pillow" "python-espeak" "webkit2gtk-4.1")
source=("https://www.bibleanalyzer.com/bibleanalyzer_${pkgver}_all.deb")
sha256sums=('b29be6abf0b0e24bfb48cbfd50b7b9e98fbdc5445ee0419c5f09f7f7da8f7502')
install="${pkgname}.install"

package() {
	tar -xf data.tar.zst -C "${pkgdir}"/
	install -Dm644 "$pkgdir/usr/share/doc/bibleanalyzer/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/lib/x86_64-linux-gnu"
    ln -s "/usr/share/espeak-data" "$pkgdir/usr/lib/x86_64-linux-gnu/espeak-data"
    ln -s "/usr/lib/webkit2gtk-4.1" "$pkgdir/usr/lib/x86_64-linux-gnu/webkit2gtk-4.1"
}
