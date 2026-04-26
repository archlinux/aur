# Maintainer: PKQYPKJ <pkqypkj@outlook.com>
# Maintainer: VeryBaaad <verybaaad@outlook.com>

pkgname=randfill
pkgver=0.2.0.r0.0341655
pkgrel=3
pkgdesc="Overwrite files with cryptographically secure random data"
arch=('any')
url="https://github.com/OpenHelloMiddle/RandFill"
license=('GPL')
makedepends=('git' 'cargo')
conflicts=("randfill-git" "randfill-bin")
options=('!debug')
source=("$pkgname::git+https://github.com/OpenHelloMiddle/RandFill.git#tag=0.2.0")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	cargo fetch
}

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/randfill"
}
