# Maintainer: iff <iff@ik.me>
pkgname="pay-respects"
pkgver=0.4.4
pkgrel=1
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/iffse/pay-respects#tag=v$pkgver")
sha1sums=('SKIP')
replace=('pay_respects')

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/pay-respects" "$pkgdir/usr/bin/pay-respects"
}

post_upgrade() {
	echo "======================================================================"
	echo "The binary name has changed from pay_respects to pay-respects"
}
