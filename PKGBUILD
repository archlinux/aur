# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=2048.zig
_pkgname=${pkgname%.zig}
pkgver=0.2.2
pkgrel=1
pkgdesc="2048 in zig"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ratakor/$pkgname"
license=('ISC')
makedepends=('zig' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/archive/$pkgver/$pkgname.tar.gz")
sha256sums=('e3c1d0ca29b96dec24c21f1d8cc7ad6da9af7d34f7431861465d96d5d0eaeaf0')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	zig build -Doptimize=ReleaseSafe -p "$pkgdir/usr"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
