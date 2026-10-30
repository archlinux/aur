# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=superhtml
pkgver=0.7.1
pkgrel=1
pkgdesc="HTML Language Server & Templating Language Library"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/kristoff-it/$pkgname"
license=('MIT')
makedepends=('git' 'anyzig')
source=("https://github.com/kristoff-it/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a5092f06540749eb7e29025651e8f9c59819b6e8a574f7a13ebccb01243c2a32')

build() {
	cd "$srcdir/$pkgname-${pkgver}"
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "$srcdir/$pkgname-${pkgver}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm755 "zig-out/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
