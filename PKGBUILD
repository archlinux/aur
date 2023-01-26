
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=rivercarro
pkgver=0.2.1
pkgrel=1
pkgdesc='A slightly modified version of rivertile layout generator for river.'
arch=('x86_64')
url='https://sr.ht/~novakane/rivercarro'
license=('GPL3')
depends=('wayland' 'wayland-protocols')
makedepends=('zig' 'git')
conflicts=('rivercarro-git')
source=("https://git.sr.ht/~novakane/$pkgname/refs/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('63e0f06f297ec646b3ebb4754be4548239ad50dcc5d0fda0d29538f6c4465e79')

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	DESTDIR="$pkgdir" zig build -Drelease-safe --prefix '/usr'
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
