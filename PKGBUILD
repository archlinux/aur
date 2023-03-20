# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=synodl
pkgver=0.5.2
pkgrel=1
pkgdesc="Command-line client for Synology's DownloadStation"
arch=("any")
url="https://code.ott.net/synodl/"
license=("GPL3")
depends=("rust")
source=("$pkgname::git+https://git.ott.net/synodl#tag=$pkgname-$pkgver")
md5sums=('SKIP')

build()
{
	cd "$srcdir/$pkgname"
	cargo build --release
}

package()
{
	install -Dm755 "$srcdir/$pkgname/target/release/synodl" \
		$pkgdir/usr/bin/synodl
}
