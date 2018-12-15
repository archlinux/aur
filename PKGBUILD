# Maintainer: dax <dev@dax.moe>
pkgname=ddcpuid
pkgver=0.10.0
pkgrel=1
pkgdesc="Advanced x86/AMD64 Processor Information Tool"
arch=('x86_64')
url="https://git.dd86k.space/dd86k/ddcpuid"
license=('MIT')
depends=()
makedepends=('ldc')
source=("https://git.dd86k.space/dd86k/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fe4fd971be6e928435fc159c830f30ec81dff210700338bc806809f0ac54899c')
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
