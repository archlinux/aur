# Maintainer: dax <dev@dax.moe>
pkgname=ff
pkgver=0.5.0
pkgrel=1
pkgdesc="Simple, human-readable, fast binary file scanner"
arch=('x86_64')
url="https://git.dd86k.space/dd86k/ff"
license=('custom')
depends=()
makedepends=('clang')
source=("https://git.dd86k.space/dd86k/$pkgname/archive/v"$pkgver".zip")
sha256sums=('fee3e7a02b985a515ddd835402942c9b931039933382c8058dd8ffef4b81efc9')
build() {
	cd "$pkgname-v"$pkgver""
	sh ./build-clang.sh
}

package() {
	cd "$pkgname-v"$pkgver""
	install -D ff "$pkgdir"/usr/bin/ff
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/ff/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/ff/README.md
	install -D -m 0644 docs/ff.1 "$pkgdir"/usr/share/man/man1/ff.1
}
