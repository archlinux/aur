# Contributor: Gabriel Moura <develop@srmoura.com.br>
# Maintainer: Bink <B-Interactive@users.noreply.github.com>

pkgname=bibleanalyzer
pkgver=5.5.1
pkgrel=1
pkgdesc="Bible Analyzer - A FREE Bible Study Solution"
arch=("any")
url="http://www.bibleanalyzer.com"
license=('Custon:bibleanalyzer')
depends=("python310" "python-wxpython>=4.2.0" "python-espeak" "webkit2gtk")
source=("https://www.bibleanalyzer.com/bibleanalyzer_${pkgver}_all.deb")
sha256sums=('60ed9c1590aeccf2981df47b7fb4b8d12a398e8398e2288223352308000672ff')

package() {
	tar -xf data.tar.zst -C "${pkgdir}"/
	install -Dm644 "$pkgdir/usr/share/doc/bibleanalyzer/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/lib/x86_64-linux-gnu"
    ln -s "/usr/share/espeak-data" "$pkgdir/usr/lib/x86_64-linux-gnu/espeak-data"
    ln -s "/usr/lib/webkit2gtk-4.0" "$pkgdir/usr/lib/x86_64-linux-gnu/webkit2gtk-4.0"
}
