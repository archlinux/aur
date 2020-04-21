# Maintainer: Raymo111 <hi@raymond.li>
pkgname=ipetitions-bot
pkgver=1.3
pkgrel=3
pkgdesc="A bot to get signatures for iPetitions"
arch=('any')
url="https://github.com/Raymo111/iPetitions-Bot"
license=('GPL3')
source=("https://github.com/Raymo111/iPetitions-Bot/archive/v$pkgver.tar.gz")
sha256sums=('0d514100cc00be31c0420e042c92a6933cc4021dcc6391f2880a0989fcceeba3')

package() {
	cd "iPetitions-Bot-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	cp -f bot.sh "$pkgdir/usr/lib/$pkgname"
	chmod +x "$pkgdir/usr/lib/$pkgname/bot.sh"
	cp -f formfind.pl "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	ln -sf "/usr/lib/$pkgname/bot.sh" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
