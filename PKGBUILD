# Maintainer: tee < teeaur at duck dot com >
pkgname=nocodb-bin
pkgver=0.109.7
pkgrel=1
pkgdesc="Open Source Airtable Alternative: Turns any MySQL, PostgreSQL, SQL Server, SQLite & MariaDB into a smart spreadsheet."
arch=("x86_64")
url="https://nocodb.com"
_src="https://github.com/nocodb/nocodb"
license=('GPL Affero')
provides=(nocodb)
conflicts=(nocodb)
source=("LICENSE::$_src/raw/$pkgver/LICENSE")
__pkgname="$pkgname-$arch-$pkgver"
source_x86_64=("$__pkgname::$_src/releases/download/$pkgver/Noco-linux-x64")
sha256sums=('d8de517917a591daa447d6be28ffb2fac866703e4feb65e86221be9a22d3033a')
sha256sums_x86_64=('317216ef0f6d5520614911800738940c097c0999c25f6a0bfc83eaa70da250ea')

package() {
	cd $srcdir
	install -Dm755 "$__pkgname" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
