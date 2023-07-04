# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.14.1
pkgrel=4
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl' 'dbus')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('8332840a79e64cb02f6b8c27d146bd6ad6f7f18d7ca67dc3e8f40505630b85da0166ca141e00ddb4e9785d88ab1377171043de04bc97e7ee46d16300a6f532b5')

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --release --locked
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
