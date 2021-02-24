# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=librespot
pkgver=0.1.6
pkgrel=1
pkgdesc="Open source client library for Spotify"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/librespot-org/librespot"
license=(MIT)
depends=(
	libpulse
	alsa-lib
	jack
	avahi
	gst-plugins-base-libs
	portaudio
	sdl2
)
makedepends=(
	cargo
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7506b4448d3ae0eba063cd711baebdc23444c706c87d0551d5a4cbc623e70f30')

build() {
	return 0
}

package() {
	cd "${pkgname}-${pkgver}"
	cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
