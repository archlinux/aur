# Contributor: Gabriel Moura <develop@srmoura.com.br>
# Maintainer: Bink <B-Interactive@users.noreply.github.com>

pkgname=bibleanalyzer
pkgver=5.6.1
pkgrel=1
pkgdesc="Bible Analyzer - A FREE Bible Study Solution"
arch=("any")
url="http://www.bibleanalyzer.com"
license=('Custon:bibleanalyzer')
depends=("python" "python-wxpython" "python-mutagen" "python-lxml" "python-configobj" "python-pillow" "python-espeak" "webkit2gtk-4.1")
makedepends=("python-distutils-extra")
source=("https://www.bibleanalyzer.com/bibleanalyzer_${pkgver}_all.deb")
sha256sums=('e260714821d34a5a262f20ffcaa79acc8f89e7347a99b97124f603c10aaa635d')

package() {
	tar -xf data.tar.zst -C "${pkgdir}"/
	install -Dm644 "$pkgdir/usr/share/doc/bibleanalyzer/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/lib/x86_64-linux-gnu"
    ln -s "/usr/share/espeak-data" "$pkgdir/usr/lib/x86_64-linux-gnu/espeak-data"
    ln -s "/usr/lib/webkit2gtk-4.1" "$pkgdir/usr/lib/x86_64-linux-gnu/webkit2gtk-4.1"
}
