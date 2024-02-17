# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.16.3
pkgrel=1
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl' 'dbus')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('01c9f3bfa93e410531bc3e070090c7a29bbed815ed2be1e4dbd48b70697198d522a336089e0533d404c7c1c13af59a49263727bd9d0aaf5753773f817e7aa876')

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --release --locked
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
