# Maintainer: tee < teeaur at duck dot com >
pkgname=nocodb-bin
pkgver=0.264.3
pkgrel=1
pkgdesc="Open Source Airtable Alternative: Turns any MySQL, PostgreSQL, SQL Server, SQLite & MariaDB into a smart spreadsheet."
arch=("x86_64")
url="https://nocodb.com"
_src="https://github.com/nocodb/nocodb"
license=('AGPL-3.0-only')
provides=(nocodb)
conflicts=(nocodb)
source=("$_src/raw/$pkgver/LICENSE")
_exe="$pkgname-$arch-$pkgver"
source_x86_64=("$_exe::$_src/releases/download/$pkgver/Noco-linux-x64")
sha256sums=('d8de517917a591daa447d6be28ffb2fac866703e4feb65e86221be9a22d3033a')
sha256sums_x86_64=('96b536cd1d7fd4dcacaad74cbcb8e7a6725d924d041742755d3359b34e75f190')
options=(!strip)

package() {
	cd "$srcdir"
	install -Dm755 "$_exe" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
