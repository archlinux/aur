# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=moc-fluidsynth-decoder-plugin
pkgver=0.0.4
pkgrel=1
pkgdesc="Decoder plugin for playing MIDI files with FluidSynth using the MOC (Music on Console) player."
arch=(x86_64)
url="https://github.com/joanbm/$pkgname"
license=('GPL2')
depends=(moc fluidsynth libsmf)
makedepends=(wget)
install=install.sh

source=("https://github.com/joanbm/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(ed72042085c8782b12713b3b5fcc170585f5cabaac7034d0b98b65fbf10e26df)

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/lib/moc/decoder_plugins"
	make PLUGINS_DIR="$pkgdir/usr/lib/moc/decoder_plugins" install
}
