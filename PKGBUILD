# Maintainer: Rafael Cruz <rafaelcruz at outlook dot com>

pkgname=fightcade2
pkgver=2.0.12
pkgrel=1
pkgdesc='The best way to play your favorite retro games with or against any other player in the world.'
url='https://play.fightcade.com/'
arch=('any')
license=('custom')
depends=(wine lib32-mpg123)
makedepends=(gendesk)
source=(https://play.fightcade.com/download/fightcade2-linux64-v2.0.12.tar.gz)
md5sums=('8efa181b26a01b5d2b633d9e3146cd69')

prepare() {
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Fightcade 2" --exec "$pkgdir/opt/$pkgname/Fightcade2"
}

package() {
	cd $srcdir/Fightcade2
	install -dm755 $pkgdir/opt/
	install -Dm644 "fc2-electron/resources/app/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	cp -r $srcdir/Fightcade2 $pkgdir/opt/$pkgname
	install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
