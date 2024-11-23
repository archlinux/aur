# Maintainer: Entailz <entail-wraps0r at icloud dot com>
pkgname=shhh-git
pkgver=0.1.f89b099
pkgrel=1
pkgdesc="Add shadows and edge rounding to screenshots"
arch=('i686' 'x86_64')
conflicts=('shhh')
provides=("shhh=${pkgver%%.r*}")
license=('MIT')
makedepends=('cargo')
source=("git+https://github.com/entailz/shhh.git")
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/shhh"
	printf "0.1.%s" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/shhh"
	cargo build --release
}

package() {
	cd "$srcdir/shhh"
	install -Dm755 "target/release/shhh" "$pkgdir/usr/bin/shhh"
}
