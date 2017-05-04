# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvipc-git
pkgver=0.0.1
pkgrel=0
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/freijon/mpvipc"
license=('GPL3')
depends=('mpv' 'socat')
makedepends=('cargo')
source=(
	"${pkgname}::git+https://github.com/freijon/mpvipc.git"
)
sha512sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname/target/release/mpvipc $pkgdir/usr/bin/mpvipc
}
