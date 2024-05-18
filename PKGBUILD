# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.18.1
pkgrel=1
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl' 'dbus')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('9c7ef072f47ab45acc05bf67025e51446db746b81287adbe3dcbde9185c6ba740f2d5f794c1b1e1e378dd0121dcf28bd56084ff692b7b1e7081a4dda6ef32072')

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --release --locked
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
