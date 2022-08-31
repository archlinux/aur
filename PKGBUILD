# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=punchy
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="A 2.5D side-scroller beatemup, made in Bevy"
arch=("x86_64")
url="https://github.com/fishfolks/punchy"
license=('Apache')
groups=()
depends=("alsa-lib" "systemd-libs" "pipewire-alsa" "pulseaudio-alsa")
makedepends=("rust")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fishfolks/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=("a2b956c6dd632a8cdc9a3b626598aa3b99e656070cfb9c8c4dc1b9e18e50add4")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D ./target/release/$pkgname $pkgdir/usr/bin/punchy
}
