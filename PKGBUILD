# Maintainer: Timo Kettenbach
pkgname=borrg
pkgver=0.1.0_pre_20221214
_commit=ced027dfafb22ca3104d02d96e9d0b1251223d40
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
sha256sums=('f8d1e8a0afbbcd2efdb7c0d3fb7c7634ca91f11c68a425e2d80faee5bab252d0')

build() {
	cd "$pkgname-$_commit"
	cargo build --release	
}

package() {
	cd "$pkgname-$_commit"
    install -Dm755 target/release/borrg -t "$pkgdir/usr/bin"
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
