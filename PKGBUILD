# Maintainer: tee < teeaur at duck dot com >
pkgname=nocodb-bin
pkgver=0.258.11
pkgrel=1
pkgdesc="Open Source Airtable Alternative: Turns any MySQL, PostgreSQL, SQL Server, SQLite & MariaDB into a smart spreadsheet."
arch=("x86_64")
url="https://nocodb.com"
_src="https://github.com/nocodb/nocodb"
license=('GPL Affero')
provides=(nocodb)
conflicts=(nocodb)
source=("$_src/raw/$pkgver/LICENSE")
__pkgname="$pkgname-$arch-$pkgver"
source_x86_64=("$__pkgname::$_src/releases/download/$pkgver/Noco-linux-x64")
sha256sums=('SKIP')
sha256sums_x86_64=('50866cc3471a25d91d66a17e58be077188b2ab996c3c54f11028c53baa211268')
options=(!strip)

package() {
	cd $srcdir
	install -Dm755 "$__pkgname" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
