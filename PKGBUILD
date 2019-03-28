# Maintainer: dax <dev@dax.moe>
pkgname=ff
pkgver=0.4.1
pkgrel=3
pkgdesc="Simple, human-readable, fast binary file scanner"
arch=('x86_64')
url="https://git.dd86k.space/dd86k/ff"
license=('MIT')
depends=()
makedepends=('clang')
source=("https://git.dd86k.space/dd86k/$pkgname/archive/v"$pkgver"a.zip")
sha256sums=('036f81bdfa93c7b5a04573bf51b162ad32d3851147ad9a64fea3444788385972')
build() {
	cd "$pkgname-v"$pkgver"a"
	sh ./build-clang.sh
}

package() {
	cd "$pkgname-v"$pkgver"a"
	install -D ff "$pkgdir"/usr/bin/ff
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/ff/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/ff/README.md
	install -D -m 0644 docs/ff.1 "$pkgdir"/usr/share/man/man1/ff.1
}
