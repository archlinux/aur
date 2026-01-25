# Maintainer: Lordseriouspig <lordseriouspig@gmail.com>
pkgname=flavorcli
pkgver=1.0.1
pkgrel=1
pkgdesc="FlavorCLI is a fully-featured implementation of the Flavortown API, allowing for easier and streamlined interaction with HackClub's Flavortown."
arch=('x86_64' 'aarch64')
url="https://github.com/lordseriouspig/flavorcli"
license=('GPL')
depends=("glibc")
makedepends=('rust' 'cargo' 'zip')
source=("https://github.com/lordseriouspig/flavorcli/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-${pkgver//_/-}"
	cargo build --release
}

package() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"
    install -Dm755 "target/release/flavor" "$pkgdir/usr/bin/flavor"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.MD" "$pkgdir/usr/share/doc/$pkgname/README.MD"
    install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
