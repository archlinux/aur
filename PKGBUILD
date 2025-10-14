# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=superhtml
pkgver=0.6.2
pkgrel=1
pkgdesc="HTML Language Server & Templating Language Library"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/kristoff-it/$pkgname"
license=('MIT')
makedepends=('git' 'zig')
source=("https://github.com/kristoff-it/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('431d7189501e1b2e8da53c3ca8d6e7f1c642b523f3715c21cb8bfd2f8eef3971')

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
