# Maintainer: redArch <redarch at protonmail dot com>
pkgname="qrode-git"
pkgver=0.0.2
pkgrel=1
pkgdesc="A tool to decode QR codes in Wayland compositors implmementing the wlr_screencopy protocol."
arch=("x86_64")
url="https://gitlab.com/redArch/wayland-screencopy-utilities"
license=("GPL")
makedepends=("rustup" "git")
optdepends=("slurp: for geometry selection")
source=("git+$url")
sha256sums=("SKIP")

build() {
	cd "wayland-screencopy-utilities/qrode"
	cargo build --release
}

package() {
	cd "wayland-screencopy-utilities"
	install -Dm 755 ./target/release/qrode "$pkgdir/usr/bin/qrode"
}
