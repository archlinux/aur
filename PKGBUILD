# Maintainer: dax <dev@dax.moe>
pkgname=ddcpuid
pkgver=0.9.0
pkgrel=1
pkgdesc="Processor information tool"
arch=('x86_64')
url="https://github.com/dd86k/ddcpuid"
license=('MIT')
depends=()
makedepends=('dmd')
source=("https://github.com/dd86k/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e333c9f1ba67b33d075be193b83d3bfcb998a6a8d17a166280237888af73b6dd')
build() {
	cd "$pkgname-$pkgver"
	dmd -betterC -O -release -boundscheck=off ddcpuid
}

package() {
	cd "$pkgname-$pkgver"
	install -D ddcpuid "$pkgdir"/usr/bin/ddcpuid
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/ddcpuid/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/ddcpuid/README.md
	install -D -m 0644 ddcpuid.1 "$pkgdir"/usr/share/man/man1/ddcpuid.1
}
