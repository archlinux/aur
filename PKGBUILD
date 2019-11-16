# Maintainer: Raymo111 <hi@raymond.li>
pkgname=ipetitions-bot
pkgver=1.1
pkgrel=1
pkgdesc="A bot to get signatures for iPetitions"
arch=('any')
url="https://github.com/Raymo111/iPetitions-Bot/blob/master/README.md"
license=('GPL3')
source=("https://github.com/Raymo111/iPetitions-Bot/archive/v${pkgver}.tar.gz")
sha256sums=('4890e9374e8cbc46049cdb7a2f7aaa3c05319f0934d9932cb9df107931af5b90')

package() {
	cd "iPetitions-Bot-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	cp -f bot.sh "$pkgdir/usr/lib/$pkgname"
	chmod +x "$pkgdir/usr/lib/$pkgname/bot.sh"
	cp -f formfind.pl "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "$pkgdir/usr/lib/$pkgname/bot.sh" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
