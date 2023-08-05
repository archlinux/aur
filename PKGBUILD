# Maintainer: iff <iff@ik.me>
pkgname="pay_respects"
pkgver=0.4.3
pkgrel=1
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=("x86_64")
url="https://github.com/iffse/pay_respects"
license=('AGPL')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/iffse/pay_respects#tag=v$pkgver")
sha1sums=('SKIP')

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/pay_respects" "$pkgdir/usr/bin/pay_respects"
}

