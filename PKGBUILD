# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=pacmanifest
pkgver=1.3.0
pkgrel=1
pkgdesc="A declarative alternative frontend for libalpm"
arch=("x86_64")
url="https://codeberg.org/GrantMoyer/pacmanifest"
license=('GPL-3.0-only')
depends=()
makedepends=("cargo")
source=("git+https://codeberg.org/GrantMoyer/pacmanifest.git#tag=v$pkgver")
sha256sums=('c6ba98f80e745c704699985745b37dbae95f17aa1a8fbeef25470dd088d5199e')

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

