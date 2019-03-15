# Maintainer: dax <dev@dax.moe>
pkgname=ff
pkgver=0.4.1
pkgrel=2
pkgdesc="Simple, human-readable, fast binary file scanner"
arch=('x86_64')
url="https://git.dd86k.space/dd86k/ff"
license=('MIT')
depends=()
makedepends=('clang')
source=("https://git.dd86k.space/dd86k/$pkgname/archive/v"$pkgver"a.tar.gz")
sha256sums=('b5f79f8d3d2d373a465252eb974d166e851b2c45e1ac2b90376e5e11e51a01e0')
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
