# Maintainer: dax <dev@dax.moe>
pkgname=ddcpuid
pkgver=0.11.0
pkgrel=1
pkgdesc="Advanced x86/AMD64 Processor Information Tool"
arch=('x86_64')
url="https://git.dd86k.space/dd86k/ddcpuid"
license=('MIT')
depends=()
makedepends=('ldc')
source=("https://git.dd86k.space/dd86k/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a166544015852732699f8b19d1fbdee32fbf72fc8e613daea43fe4c22c98006f')
build() {
	cd "$pkgname-v$pkgver"
	ldc -betterC -O -boundscheck=off ddcpuid
}

package() {
	cd "$pkgname-v$pkgver"
	install -D ddcpuid "$pkgdir"/usr/bin/ddcpuid
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/ddcpuid/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/ddcpuid/README.md
	install -D -m 0644 ddcpuid.1 "$pkgdir"/usr/share/man/man1/ddcpuid.1
}
