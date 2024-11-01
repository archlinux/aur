# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=superhtml
pkgver=0.5.3
pkgrel=1
pkgdesc="HTML Language Server & Templating Language Library"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/kristoff-it/$pkgname"
license=('MIT')
makedepends=('git' 'zig')
source=("https://github.com/kristoff-it/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e1e514995b7a834880fe777f0ede4bd158a2b4a9e41f3a6fd8ede852f327fe8f')

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
