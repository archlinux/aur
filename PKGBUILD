# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=ncmpvc-git
pkgver=0.0.1
pkgrel=2
pkgdesc="A ncurses client for mpv which connects to existing mpv instances through sockets, written in Rust. WARNING: Early development stage, for bug-hunters only!"
arch=('x86_64')
url="https://github.com/freijon/ncmpvc"
license=('MIT')
depends=('mpv' 'ncurses')
makedepends=('cargo')
source=("${pkgname}::git+https://github.com/freijon/ncmpvc.git")
sha512sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname/target/release/ncmpvc $pkgdir/usr/bin/ncmpvc
}
