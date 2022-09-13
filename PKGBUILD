# Maintainer: Timo Kettenbach
pkgname=borrg
pkgver=0.1.0_pre_20220618
_commit=2b85f68ad9c438b1804286935eec50a4ce6ccccf
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
sha256sums=('bbb3847a2a5b60c9001bf47204b2c0db9510a34da9c0bfd7df05090410ca9321')

build() {
	cd "$pkgname-$_commit"
	cargo build --release	
}

package() {
	cd "$pkgname-$_commit"
    install -Dm755 target/release/borrg -t "$pkgdir/usr/bin"
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
