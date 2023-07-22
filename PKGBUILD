# Maintainer: tee < teeaur at duck dot com >
pkgname=nocodb-bin
pkgver=0.109.4
pkgrel=1
pkgdesc="Open Source Airtable Alternative: Turns any MySQL, PostgreSQL, SQL Server, SQLite & MariaDB into a smart spreadsheet."
arch=("x86_64")
url="https://nocodb.com"
_srcurl="https://github.com/nocodb/nocodb"
license=('GPL Affero')
provides=(nocodb)
conflicts=(nocodb)
source=("$_srcurl/raw/develop/LICENSE")
__pkgname="$pkgname-$arch-$pkgver"
source_x86_64=("$__pkgname::$_srcurl/releases/download/$pkgver/Noco-linux-x64")
sha256sums=('d8de517917a591daa447d6be28ffb2fac866703e4feb65e86221be9a22d3033a')
sha256sums_x86_64=('5702c598b0462fcc6e6c6d67554b32c2d5ce98e6871ffc386de34cb380c286f7')

package() {
	cd $srcdir
	install -Dm755 "$__pkgname" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
