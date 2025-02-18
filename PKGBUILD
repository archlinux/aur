# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=pacmanifest
pkgver=1.3.1
pkgrel=1
pkgdesc="A declarative alternative frontend for libalpm"
arch=("x86_64")
url="https://codeberg.org/GrantMoyer/pacmanifest"
license=('GPL-3.0-only')
depends=()
makedepends=("cargo")
source=("git+https://codeberg.org/GrantMoyer/pacmanifest.git#tag=v$pkgver")
sha256sums=('4b22fec14f731e804ba71d48fdae1ed80c8fa2a9cb3d8ad9131b354b3c3581c3')

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

