# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=moc-fluidsynth-plugin
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
sha256sums=(775e7087f2414c29cf399de23f45a7e29303dd7726dfa22d1f9d0df6f6257d50)

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/lib/moc/decoder_plugins"
	make PLUGINS_DIR="$pkgdir/usr/lib/moc/decoder_plugins" install
}
