# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=rsflex
pkgver=0.1
pkgrel=1
pkgdesc="A super fast system information displayer written in Rust"
arch=('any')
url="https://github.com/curlpipe/rsflex"
license=('MPL-2.0')
makedepends=('cargo' 'git')
provides=("rsflex")
source=("$pkgname::git+https://github.com/curlpipe/rsflex")
sha1sums=('SKIP')

build() {
	cd "$pkgname"
	cargo build --release --target-dir=target
}

check() {
	cd "$pkgname"
	cargo test --release --target-dir=target
}

package() {
	cd "$pkgname"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
