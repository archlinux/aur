# Maintainer: dax <dev@dax.moe>
pkgname=ddcpuid
pkgver=0.8.0
pkgrel=1
pkgdesc="Processor information tool"
arch=('x86_64')
url="https://github.com/dd86k/ddcpuid"
license=('MIT')
depends=()
makedepends=('dmd')
source=("https://github.com/dd86k/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('08c95a57cd4e0b7e8ee5f6754f42f09b0778807124e42c357b29a2d72eb9d9e5')
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
