# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=srtune-git
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast and lightweight subtitle file manipulator capable of correcting time shift, drift, and cuts. (command line tool)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://git.ondrovo.com/MightyPork/srtune"
license=('MIT')
makedepends=('rust' 'cargo' 'git')
source=("git+https://git.ondrovo.com/MightyPork/srtune.git#tag=0.3")
md5sums=('SKIP')

build() {
	cd "$srcdir/srtune"
	cargo build --release
}

package() {
	install -D -m0755 "$srcdir/srtune/target/release/srtune" "$pkgdir/usr/bin/srtune"
}
