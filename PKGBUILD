# Maintainer: PKQYPKJ <pkqypkj@outlook.com>
# Maintainer: VeryBaaad <verybaaad@outlook.com>

_pkgname=randfill
pkgname=$_pkgname-git
pkgver=0.1.1.r1.e1df4b9
pkgrel=1
pkgdesc="Overwrite files with cryptographically secure random data"
arch=('any')
url="https://github.com/OpenHelloMiddle/RandFill"
license=('GPL')
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
