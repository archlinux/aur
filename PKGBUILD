# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=punchy
pkgver=0.1.0
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
sha256sums=("0a0a1182d347c542c75f01cd72155cf7ffc9717b7c06b8a02ce756a6ae4e2656")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D ./target/release/$pkgname $pkgdir/usr/bin/punchy
}
