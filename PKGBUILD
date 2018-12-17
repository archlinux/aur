# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.1.3
pkgrel=1
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('hidapi')
makedepends=('cargo')
source=("$pkgname.tar.gz"::https://crates.io/api/v1/crates/$pkgname/$pkgver/download)
sha512sums=('43880b6cb9bb152a1179d02b4290ff6c4dbbdae3c5cb46c0c5cdc382d2a5d8322de97d94b1842b6e93bba97bc3d451bc8946da6d6c0b66fb7d9ed8936df2c263')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nitrocli "$pkgdir"/usr/bin/nitrocli
	install -Dm644 doc/nitrocli.1 "$pkgdir"/usr/share/man/man1/nitrocli.1
}
