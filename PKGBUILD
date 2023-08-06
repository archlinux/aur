# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.15.0
pkgrel=1
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl' 'dbus')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('5eb1016710bdc1ff71d22168c63104a64ce1d39cf07e46c49afbd98ee9da59afe8f6cac08d118f03915feef18adbd7fd53311d4ebab4db40168edfba415fc203')

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --release --locked
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
