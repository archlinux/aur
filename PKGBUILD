# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=punchy
pkgver=0.0.3
pkgrel=1
epoch=
pkgdesc="A 2.5D side-scroller beatemup, made in Bevy"
arch=("x86_64")
url="https://github.com/fishfolks/punchy"
license=('Apache')
groups=()
depends=("alsa-lib" "systemd-libs" "libx11" "pkgconf" "pipewire-alsa" "pulseaudio-alsa")
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
source=("https://github.com/fishfolks/$pkgname/archive/refs/tags/v$pkgver.zip")
noextract=()
sha256sums=("9ddd417d9600b5ecd1975297d523e81b26f6982c618cc6faf69b3865291ba0af")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D ./target/release/$pkgname $pkgdir/usr/bin/punchy
}
