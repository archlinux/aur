# Maintainer: Raymo111 <hi@raymond.li>
pkgname=ipetitions-bot
pkgver=1.4
pkgrel=1
pkgdesc="A bot to get signatures for iPetitions"
arch=('any')
url="https://github.com/Raymo111/iPetitions-Bot"
license=('GPL3')
source=("https://github.com/Raymo111/iPetitions-Bot/archive/v$pkgver.tar.gz")
sha256sums=('384dcded7c870551f89d3bd99818a4f0fddbe27ca9f3d03f8803c08d84b583e3')

package() {
	cd "iPetitions-Bot-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	cp -f bot.sh "$pkgdir/usr/lib/$pkgname"
	chmod +x "$pkgdir/usr/lib/$pkgname/bot.sh"
	mkdir -p "$pkgdir/usr/bin"
	ln -sf "/usr/lib/$pkgname/bot.sh" "$pkgdir/usr/bin/$pkgname"
	#chmod +x "/usr/bin/$pkgname"
}
