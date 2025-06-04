# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=pacmanifest
pkgver=1.4.0
pkgrel=1
pkgdesc="A declarative alternative frontend for libalpm"
arch=("x86_64")
url="https://codeberg.org/GrantMoyer/pacmanifest"
license=('GPL-3.0-only')
depends=()
makedepends=("cargo")
source=("git+https://codeberg.org/GrantMoyer/pacmanifest.git#tag=v$pkgver")
sha256sums=('949a27b37c1f329945c3eaf0067e46097e4550423fd9a77e7f4592dcbe172923')

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

