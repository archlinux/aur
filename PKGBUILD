# Maintainer: Raymo111 <hi@raymond.li>
pkgname=ipetitions-bot
pkgver=1.3
pkgrel=2
pkgdesc="A bot to get signatures for iPetitions"
arch=('any')
url="https://github.com/Raymo111/iPetitions-Bot"
license=('GPL3')
source=("https://github.com/Raymo111/iPetitions-Bot/archive/v$pkgver.tar.gz")
sha256sums=('49c0686192e4eedec3d77b37a8b23e94cf3e0bb1ab5138919348f2fdfbab99f1')

package() {
	cd "iPetitions-Bot-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	cp -f bot.sh "$pkgdir/usr/lib/$pkgname"
	chmod +x "$pkgdir/usr/lib/$pkgname/bot.sh"
	cp -f formfind.pl "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	ln -sf "$pkgdir/usr/lib/$pkgname/bot.sh" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
