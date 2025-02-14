# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=pacmanifest
pkgver=1.2.0
pkgrel=1
pkgdesc="A declarative alternative frontend for libalpm"
arch=("x86_64")
url="https://codeberg.org/GrantMoyer/pacmanifest"
license=('GPL-3.0-only')
depends=()
makedepends=("cargo")
source=("git+https://codeberg.org/GrantMoyer/pacmanifest.git#tag=v$pkgver")
sha256sums=('bc961c9afcd1716c5048d80dec63e880184c004ea1ece57f2c4f046bc00e4b5b')

build() {
	cd pacmanifest
	cargo build --release
}

check() {
	cd pacmanifest
	cargo test --release
}

package() {
	cd pacmanifest
	install -Dt "$pkgdir/usr/bin/" target/release/pacmanifest
}

