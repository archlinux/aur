# Maintainer: Raymo111 <hi@raymond.li>
pkgname=ipetitions-bot
pkgver=1.3
pkgrel=1
pkgdesc="A bot to get signatures for iPetitions"
arch=('any')
url="https://github.com/Raymo111/iPetitions-Bot"
license=('GPL3')
source=("https://github.com/Raymo111/iPetitions-Bot/archive/v$pkgver.tar.gz")
sha256sums=('4c852c3770b1ef4e271b6b43f9397b1f955970295ca2aeee329d21942f41d9ef')

package() {
	cd "iPetitions-Bot-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	cp -f bot.sh "$pkgdir/usr/lib/$pkgname"
	chmod +x "$pkgdir/usr/lib/$pkgname/bot.sh"
	cp -f formfind.pl "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	rm -rf "$pkgdir/usr/bin/$pkgname"
	ln -s "$pkgdir/usr/lib/$pkgname/bot.sh" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
