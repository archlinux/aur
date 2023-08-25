# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=2048.zig
_pkgname=${pkgname%.zig}
pkgver=0.2.0
pkgrel=1
pkgdesc="2048 in zig"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ratakor/$pkgname"
license=('ISC')
depends=('zig')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/archive/$pkgver/$pkgname.tar.gz")
sha256sums=('a040fa5e5d805335519cf7f2ea636d0f4de08c0d2d0a5c8672b03859685b6076')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	zig build -Doptimize=ReleaseSafe -p "$pkgdir/usr"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
