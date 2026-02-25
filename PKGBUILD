# Contributor: Gabriel Moura <develop@srmoura.com.br>
# Maintainer: Bink

pkgname=bibleanalyzer
pkgver=5.6.5
pkgrel=2
pkgdesc="A free Bible study solution with exciting premium features."
arch=("any")
url="https://www.bibleanalyzer.com"
license=('Custon:bibleanalyzer')
depends=(
	"python"
	"python-wxpython"
	"python-mutagen"
	"python-lxml"
	"python-configobj"
	"python-pillow"
	"python-espeak"
	"webkit2gtk-4.1"
	"lib32-gnutls"
)
source=("${url}/${pkgname}_${pkgver}_all.deb")
sha256sums=('b29be6abf0b0e24bfb48cbfd50b7b9e98fbdc5445ee0419c5f09f7f7da8f7502')
b2sums=('eb7a777cb523c0e685021ab5324aa2ffdd9605dc2c92f3c9a4d4cdc780c73fc2ec4b8c5156298bc5fea793a57dc306f7558b8439b4ab9768fff121a64e999ffb')
install="${pkgname}.install"

package() {
	tar -xf data.tar.zst -C "${pkgdir}"/
	install -Dm644 "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/lib/x86_64-linux-gnu"
    ln -s "/usr/share/espeak-data" "$pkgdir/usr/lib/x86_64-linux-gnu/espeak-data"
    ln -s "/usr/lib/webkit2gtk-4.1" "$pkgdir/usr/lib/x86_64-linux-gnu/webkit2gtk-4.1"
}
