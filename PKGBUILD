# Maintainer: Timo Kettenbach
pkgname=borrg
pkgver=0.1.0_pre_20220922
_commit=09fd8420c828c1723b3277f4290eaa7a88978a40
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
sha256sums=('8c02c9951170dbe35f2484bada125e80cf39603549dd4ed05a88eb846e9752c1')

build() {
	cd "$pkgname-$_commit"
	cargo build --release	
}

package() {
	cd "$pkgname-$_commit"
    install -Dm755 target/release/borrg -t "$pkgdir/usr/bin"
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
