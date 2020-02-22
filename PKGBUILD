# Maintainer: dax <dev@dax.moe>
pkgname=ddcpuid
pkgver=0.14.1
pkgrel=1
pkgdesc="dd's x86 CPU Identification tool"
arch=('x86_64')
url="https://github.com/dd86k/ddcpuid"
license=('MIT')
depends=()
makedepends=('ldc')
source=("https://github.com/dd86k/$pkgname/archive/v$pkgver.zip")
sha256sums=('cf93bb26cf4a78603888f296fa26122d98c0473363a3d0a844c366dc65a7c59e')

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
