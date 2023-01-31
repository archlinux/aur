# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=punchy
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="A 2.5D side-scroller beatemup, made in Bevy"
arch=("x86_64")
url="https://github.com/fishfolks/punchy"
license=('Apache')
groups=()
depends=("alsa-lib" "systemd-libs" "libx11" "pkgconf")
makedepends=("rust")
checkdepends=()
optdepends=("mesa-vulkan-drivers" "pipewire-alsa" "pulseaudio-alsa" "vulkan-radeon" "vulkan-intel")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fishfolks/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=("ec3a64ce0eacd3e8acd9e66d0d1f46035a0e1566952af24428341dcb0508a441")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D ./target/release/$pkgname $pkgdir/opt/punchy/punchy
	cp -R ./assets $pkgdir/opt/punchy/assets
	mkdir -p $pkgdir/usr/bin
	ln -s $pkgir/opt/punchy/punchy $pkgdir/usr/bin
}
