# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=rsflex
pkgver=0.1
pkgrel=1

pkgdesc="A super fast system information displayer written in Rust"
url="https://github.com/curlpipe/rsflex"
arch=('x86_64')
license=('MPL-2.0')
depends=()
makedepends=('git' 'cargo' 'rust')
provides=("$pkgname")
conflicts=("$pkgname")
replaces=()
backup=()
options=()
install=
source=('$pkgname::git+https://github.com/curlpipe/rsflex.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	cargo build --release
}

check() {
	cd "$srcdir/$pkgname"
	cargo test --release
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
