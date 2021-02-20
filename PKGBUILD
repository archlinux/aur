# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=librespot
pkgver=0.1.3
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
sha256sums=('2d28a63c6dda08ecbc1245c7cfe34c9b3b29e8c5304f4aa8b65aedb899056b25')

build() {
	return 0
}

package() {
	cd "${pkgname}-${pkgver}"
	cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
