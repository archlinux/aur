# Maintainer: dax <dev@dax.moe>
pkgname=ddcpuid
pkgver=0.14.0
pkgrel=1
pkgdesc="Advanced x86/AMD64 Processor Information Tool"
arch=('x86_64')
url="https://github.com/dd86k/ddcpuid"
license=('MIT')
depends=()
makedepends=('ldc')
source=("https://github.com/dd86k/$pkgname/archive/v$pkgver.zip")
sha256sums=('d9c5829a609a71cc0fba6407967915e70260a4ce9777b1082463a1ba66b54787')

build() {
	cd "$pkgname-$pkgver"
	ldc -betterC -release -O -boundscheck=off ddcpuid
}

package() {
	cd "$pkgname-$pkgver"
	install -D ddcpuid "$pkgdir"/usr/bin/ddcpuid
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/ddcpuid/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/ddcpuid/README.md
	install -D -m 0644 ddcpuid.1 "$pkgdir"/usr/share/man/man1/ddcpuid.1
}
