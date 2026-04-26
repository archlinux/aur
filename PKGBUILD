# Maintainer: PKQYPKJ <pkqypkj@outlook.com>
# Maintainer: VeryBaaad <verybaaad@outlook.com>

_pkgname=randfill
pkgname=$_pkgname-git
pkgver=0.2.0.r0.0341655
pkgrel=4
pkgdesc="Overwrite files with cryptographically secure random data"
arch=('any')
url="https://github.com/OpenHelloMiddle/RandFill"
license=('MIT')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
source=("$_pkgname::git+https://github.com/OpenHelloMiddle/RandFill.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	cargo fetch
}

build() {
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/randfill"
}
