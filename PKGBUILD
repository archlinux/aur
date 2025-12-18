# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=pacmanifest
pkgver=1.6.0
pkgrel=1
pkgdesc="A declarative alternative frontend for libalpm"
arch=("x86_64")
url="https://codeberg.org/GrantMoyer/pacmanifest"
license=('GPL-3.0-only')
depends=()
makedepends=("cargo")
source=("git+https://codeberg.org/GrantMoyer/pacmanifest.git#tag=v$pkgver")
sha256sums=('0349ebaae4ab335f699214ad4245b08e38d03538547c76967cbd344067b54886')

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
