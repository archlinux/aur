# Maintainer: dax <dev@dax.moe>
pkgname=ff
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple, human-readable, fast binary file scanner"
arch=('x86_64')
url="https://git.dd86k.space/dd86k/ff"
license=('MIT')
depends=()
makedepends=('clang')
source=("https://git.dd86k.space/dd86k/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ae39a976623863903f0daeefffb444c0323f93f7021c9a426ee8b73481fdc2a1')
build() {
	cd "$pkgname-v$pkgver"
	sh ./build-clang.sh
}

package() {
	cd "$pkgname-v$pkgver"
	install -D ff "$pkgdir"/usr/bin/ff
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/ff/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/ff/README.md
	install -D -m 0644 docs/ff.1 "$pkgdir"/usr/share/man/man1/ff.1
}
