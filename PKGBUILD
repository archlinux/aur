# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=punchy
pkgver=0.2.0
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
sha256sums=("cb9693e051773aae108a1ec15978f603d790f4904f254f72bb75157d11adce4c")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D ./target/release/$pkgname $pkgdir/usr/bin/punchy
}
