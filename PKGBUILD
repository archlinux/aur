# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=moc-fluidsynth-plugin
pkgver=0.0.5
pkgrel=1
pkgdesc="Plugin for playing MIDI files with FluidSynth using the MOC (Music on Console) player."
arch=(x86_64)
url="https://github.com/joanbm/$pkgname"
license=('GPL2')
depends=(moc fluidsynth libsmf)
install=install.sh

source=("https://github.com/joanbm/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(fe937807f3b06615eaa73f8ffd8c262d32b8b6cc682a62d9d2996bdfdb16f427)

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/lib/moc/decoder_plugins"
	make PLUGINS_DIR="$pkgdir/usr/lib/moc/decoder_plugins" install
}
