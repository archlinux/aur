# Maintainer: dax <dev@dax.moe>
pkgname=ddcpuid
pkgver=0.13.0
pkgrel=1
pkgdesc="Advanced x86/AMD64 Processor Information Tool"
arch=('x86_64')
url="https://git.dd86k.space/dd86k/ddcpuid"
license=('MIT')
depends=()
makedepends=('ldc')
source=("https://git.dd86k.space/dd86k/$pkgname/archive/v$pkgver.zip")
sha256sums=('2488c6f492b2b38a7fb31a279e9cded906731b938bd1b82420ab272f484c5bfd')

build() {
	cd "$pkgname-v$pkgver"
	ldc -betterC -release -O -boundscheck=off ddcpuid
}

package() {
	cd "$pkgname-v$pkgver"
	install -D ddcpuid "$pkgdir"/usr/bin/ddcpuid
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/ddcpuid/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/ddcpuid/README.md
	install -D -m 0644 ddcpuid.1 "$pkgdir"/usr/share/man/man1/ddcpuid.1
}
