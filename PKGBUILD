# Maintainer: Timo Kettenbach
pkgname=borrg
pkgver=0.1.0_pre_20220921
_commit=2300c634931264d5ae31c2791645541ab4e14e29
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
sha256sums=('94bc8d811ce7b0a46454d74199a92c2efbdc51379cd3158db0dd3d5ea66b3ee8')

build() {
	cd "$pkgname-$_commit"
	cargo build --release	
}

package() {
	cd "$pkgname-$_commit"
    install -Dm755 target/release/borrg -t "$pkgdir/usr/bin"
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
