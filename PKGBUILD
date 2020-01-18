# Maintainer: Raymo111 <hi@raymond.li>
pkgname=ipetitions-bot
pkgver=1
pkgrel=2
pkgdesc="A bot to get signatures for iPetitions"
arch=('any')
url="https://github.com/Raymo111/iPetitions-Bot/blob/master/README.md"
license=('GPL3')
source=("https://github.com/Raymo111/iPetitions-Bot/archive/v$pkgver.$pkgrel.tar.gz")
sha256sums=('3429d13ac81a1af8332acb666b461958dd337b8d9bf28aac419c391b3faba888')

package() {
	cd "iPetitions-Bot-$pkgver.$pkgrel"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	cp -f bot.sh "$pkgdir/usr/lib/$pkgname"
	chmod +x "$pkgdir/usr/lib/$pkgname/bot.sh"
	cp -f formfind.pl "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "$pkgdir/usr/lib/$pkgname/bot.sh" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
