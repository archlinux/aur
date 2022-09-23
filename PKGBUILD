# Maintainer: Timo Kettenbach
pkgname=borrg
pkgver=0.1.0_pre_20220923
_commit=8e94fdb8e7ba3d1557ff13bc68dcbfbb10e0f049
pkgrel=1
pkgdesc="A borg wrapper written in rust"
url="https://github.com/SebastianSpeitel/borrg"
license=("Apache-2.0" "Apache-2.0-with-LLVM-exceptions" "Boost-1.0" "MIT" "Unlicense")
arch=("x86_64")
depends=('borgbackup')
makedepends=('rust')
provides=("borrg")
conflicts=("borrg-bin")
source=("https://github.com/SebastianSpeitel/borrg/archive/${_commit}.tar.gz")
sha256sums=('b846cc0cde110fdc4d559f65d8659923d2f1103876921cdf3b08d58df8d39abb')

build() {
	cd "$pkgname-$_commit"
	cargo build --release	
}

package() {
	cd "$pkgname-$_commit"
    install -Dm755 target/release/borrg -t "$pkgdir/usr/bin"
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
